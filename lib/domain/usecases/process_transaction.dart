library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

abstract class ProcessTransaction {
  Future<Either<Failure, Transaction>> call(ProcessTransactionParams params);
}

class ProcessTransactionImpl implements ProcessTransaction {
  final TransactionRepository repository;
  final int maxRetries;
  final Duration retryDelay;

  ProcessTransactionImpl({
    required this.repository,
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 2),
  });

  @override
  Future<Either<Failure, Transaction>> call(
    ProcessTransactionParams params,
  ) async {
    try {
      params.validate();

      if (params.amount < AppConstants.minTransactionAmount) {
        return Left(InvalidDataFailure(
          '${AppConstants.transactionMinAmountMessage}: mínimo ${AppConstants.minTransactionAmount}',
        ));
      }

      int attempts = 0;
      Either<Failure, Transaction>? lastResult;

      while (attempts < maxRetries) {
        attempts++;

        final result = await repository.processTransaction(
          userId: params.userId,
          amount: params.amount,
          currency: params.currency,
          paymentMethod: params.paymentMethod,
          description: params.description,
        );

        lastResult = result;

        if (result.isRight()) {
          return result;
        }

        final failure = result.fold((l) => l, (r) => r as dynamic);

        if (failure is NetworkFailure || failure is TimeoutFailure) {
          if (attempts < maxRetries) {
            await Future.delayed(retryDelay * attempts);
            continue;
          }
        }

        if (failure is ServerFailure) {
          final statusCode = failure.errorData?['status'] as int?;

          if (statusCode != null && statusCode >= 500) {
            if (attempts < maxRetries) {
              await Future.delayed(retryDelay * attempts);
              continue;
            }
          }
        }

        return result;
      }

      return lastResult ??
          const Left(GenericFailure('Error al procesar transacción'));
    } on ValidationException catch (e) {
      return Left(InvalidDataFailure(e.errors.join(', ')));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, errorData: e.errorData));
    } catch (e) {
      return Left(GenericFailure('Error inesperado: $e'));
    }
  }
}

class ProcessTransactionParams extends Equatable {
  final String userId;
  final double amount;
  final String currency;
  final Map<String, dynamic> paymentMethod;
  final String? description;
  final bool enableRetry;
  final Map<String, String>? metadata;

  const ProcessTransactionParams({
    required this.userId,
    required this.amount,
    this.currency = 'USD',
    required this.paymentMethod,
    this.description,
    this.enableRetry = true,
    this.metadata,
  });

  @override
  List<Object?> get props => [
        userId,
        amount,
        currency,
        paymentMethod,
        description,
        enableRetry,
        metadata,
      ];

  ProcessTransactionParams copyWith({
    String? userId,
    double? amount,
    String? currency,
    Map<String, dynamic>? paymentMethod,
    String? description,
    bool? enableRetry,
    Map<String, String>? metadata,
  }) {
    return ProcessTransactionParams(
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      description: description ?? this.description,
      enableRetry: enableRetry ?? this.enableRetry,
      metadata: metadata ?? this.metadata,
    );
  }

  void validate() {
    final errors = <String>[];

    if (userId.isEmpty) {
      errors.add('El ID de usuario es requerido');
    }

    if (amount <= 0) {
      errors.add('El monto debe ser mayor a cero');
    }

    if (amount < AppConstants.minTransactionAmount) {
      errors.add(
        'El monto mínimo para transacción es ${AppConstants.minTransactionAmount}',
      );
    }

    if (currency.isEmpty) {
      errors.add('La moneda es requerida');
    }

    if (paymentMethod.isEmpty) {
      errors.add('El método de pago es requerido');
    }

    final requiredPaymentKeys = ['type', 'details'];
    for (final key in requiredPaymentKeys) {
      if (!paymentMethod.containsKey(key)) {
        errors.add('El método de pago debe contener: $key');
      }
    }

    if (errors.isNotEmpty) {
      throw ValidationException(
        'Validación de transacción fallida',
        errors,
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'amount': amount,
      'currency': currency,
      'payment_method': paymentMethod,
      if (description != null) 'description': description,
      if (metadata != null) 'metadata': metadata,
    };
  }
}
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/errors/failures.dart';
import '../entities/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, Transaction>> processTransaction({
    required String userId,
    required double amount,
    required String currency,
    required Map<String, dynamic> paymentMethod,
    String? description,
  });

  Future<Either<Failure, Transaction>> getTransactionById(String transactionId);

  Future<Either<Failure, List<Transaction>>> getTransactionsByUserId(
    String userId, {
    int? limit,
    int? offset,
  });

  Future<Either<Failure, Transaction>> refundTransaction(
    String transactionId, {
    required String reason,
  });

  Future<Either<Failure, TransactionStatus>> getTransactionStatus(
    String transactionId,
  );
}

class TransactionParams extends Equatable {
  final String userId;
  final double amount;
  final String currency;
  final Map<String, dynamic> paymentMethod;
  final String? description;
  final DateTime? scheduledAt;
  final Map<String, String>? metadata;

  const TransactionParams({
    required this.userId,
    required this.amount,
    required this.currency,
    required this.paymentMethod,
    this.description,
    this.scheduledAt,
    this.metadata,
  });

  @override
  List<Object?> get props => [
        userId,
        amount,
        currency,
        paymentMethod,
        description,
        scheduledAt,
        metadata,
      ];

  TransactionParams copyWith({
    String? userId,
    double? amount,
    String? currency,
    Map<String, dynamic>? paymentMethod,
    String? description,
    DateTime? scheduledAt,
    Map<String, String>? metadata,
  }) {
    return TransactionParams(
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      description: description ?? this.description,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      metadata: metadata ?? this.metadata,
    );
  }
}

enum TransactionStatus {
  pending,
  processing,
  completed,
  failed,
  refunded,
  cancelled;

  bool get isFinal =>
      this == completed ||
      this == failed ||
      this == refunded ||
      this == cancelled;

  bool get isSuccessful => this == completed;

  String get displayName {
    switch (this) {
      case TransactionStatus.pending:
        return 'Pendiente';
      case TransactionStatus.processing:
        return 'Procesando';
      case TransactionStatus.completed:
        return 'Completada';
      case TransactionStatus.failed:
        return 'Fallida';
      case TransactionStatus.refunded:
        return 'Reembolsada';
      case TransactionStatus.cancelled:
        return 'Cancelada';
    }
  }
}

extension TransactionStatusX on TransactionStatus {
  static TransactionStatus fromString(String value) {
    return TransactionStatus.values.firstWhere(
      (status) => status.name.toLowerCase() == value.toLowerCase(),
      orElse: () => TransactionStatus.pending,
    );
  }
}
package flutter_ecommerce_app.data.repositories;

import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/errors/exceptions.dart';
import 'package:flutter_ecommerce_app/core/errors/failures.dart';
import 'package:flutter_ecommerce_app/domain/entities/transaction.dart' as domain;
import 'package:flutter_ecommerce_app/domain/repositories/transaction_repository.dart';
import 'package:flutter_ecommerce_app/data/datasources/transaction_remote_datasource.dart';
import 'package:flutter_ecommerce_app/data/models/transaction_model.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;
  
  TransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<domain.Transaction>>> getTransactions() async {
    try {
      final transactionModels = await remoteDataSource.fetchTransactions();
      final transactions = transactionModels.map((model) => model.toEntity()).toList();
      return Right(transactions);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on InvalidDataException catch (e) {
      return Left(InvalidDataFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, domain.Transaction>> getTransactionById(String id) async {
    if (id.isEmpty) {
      return const Left(InvalidDataFailure('Transaction ID cannot be empty'));
    }
    
    try {
      final transactionModel = await remoteDataSource.fetchTransactionById(id);
      return Right(transactionModel.toEntity());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on InvalidDataException catch (e) {
      return Left(InvalidDataFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, domain.Transaction>> createTransaction(domain.Transaction transaction) async {
    if (transaction == null) {
      return const Left(InvalidDataFailure('Transaction cannot be null'));
    }
    
    if (transaction.amount < AppConstants.minTransactionAmount) {
      return Left(TransactionFailure(
        AppConstants.transactionMinAmountMessage,
      ));
    }
    
    try {
      final transactionModel = TransactionModel.fromEntity(transaction);
      final createdModel = await remoteDataSource.createTransaction(transactionModel);
      return Right(createdModel.toEntity());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on TransactionException catch (e) {
      return Left(TransactionFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on InvalidDataException catch (e) {
      return Left(InvalidDataFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, List<domain.Transaction>>> getTransactionsByUserId(String userId) async {
    if (userId.isEmpty) {
      return const Left(InvalidDataFailure('User ID cannot be empty'));
    }
    
    try {
      final allTransactions = await remoteDataSource.fetchTransactions();
      final filteredTransactions = allTransactions.where((transaction) {
        return transaction.userId == userId;
      }).toList();
      
      final transactions = filteredTransactions.map((model) => model.toEntity()).toList();
      return Right(transactions);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, domain.Transaction>> updateTransactionStatus(
    String transactionId, 
    String newStatus,
  ) async {
    if (transactionId.isEmpty) {
      return const Left(InvalidDataFailure('Transaction ID cannot be empty'));
    }
    
    if (newStatus.isEmpty) {
      return const Left(InvalidDataFailure('Status cannot be empty'));
    }
    
    try {
      final updatedModel = await remoteDataSource.updateTransactionStatus(
        transactionId, 
        newStatus,
      );
      return Right(updatedModel.toEntity());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on TransactionException catch (e) {
      return Left(TransactionFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }
}
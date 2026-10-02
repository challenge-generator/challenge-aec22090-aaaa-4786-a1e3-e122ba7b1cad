part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object?> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionProcessing extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final Transaction transaction;

  const TransactionSuccess({required this.transaction});

  @override
  List<Object?> get props => [transaction];
}

class TransactionError extends TransactionState {
  final String message;
  final int? code;

  const TransactionError({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];
}

class TransactionHistoryLoaded extends TransactionState {
  final List<Transaction> transactions;

  const TransactionHistoryLoaded({required this.transactions});

  @override
  List<Object?> get props => [transactions];
}
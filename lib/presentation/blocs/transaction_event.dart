part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

class ProcessPayment extends TransactionEvent {
  final Cart cart;
  final String paymentMethod;
  final String shippingAddress;

  const ProcessPayment({
    required this.cart,
    required this.paymentMethod,
    required this.shippingAddress,
  });

  @override
  List<Object?> get props => [cart, paymentMethod, shippingAddress];
}

class LoadTransactionHistory extends TransactionEvent {}

class CancelTransaction extends TransactionEvent {
  final String transactionId;

  const CancelTransaction(this.transactionId);

  @override
  List<Object?> get props => [transactionId];
}

class RefundTransaction extends TransactionEvent {
  final String transactionId;

  const RefundTransaction(this.transactionId);

  @override
  List<Object?> get props => [transactionId];
}
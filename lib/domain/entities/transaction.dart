library flutter_ecommerce_app.domain.entities.transaction;

import 'package:equatable/equatable.dart';
import 'cart.dart';

enum TransactionStatus {
  pending,
  processing,
  completed,
  failed,
  cancelled,
  refunded;

  bool get isPending => this == TransactionStatus.pending;
  bool get isProcessing => this == TransactionStatus.processing;
  bool get isCompleted => this == TransactionStatus.completed;
  bool get isFailed => this == TransactionStatus.failed;
  bool get isCancelled => this == TransactionStatus.cancelled;
  bool get isRefunded => this == TransactionStatus.refunded;
  bool get isTerminal => isCompleted || isFailed || isCancelled || isRefunded;

  String get displayName {
    switch (this) {
      case TransactionStatus.pending:
        return 'Pending';
      case TransactionStatus.processing:
        return 'Processing';
      case TransactionStatus.completed:
        return 'Completed';
      case TransactionStatus.failed:
        return 'Failed';
      case TransactionStatus.cancelled:
        return 'Cancelled';
      case TransactionStatus.refunded:
        return 'Refunded';
    }
  }
}

enum PaymentMethod {
  creditCard,
  debitCard,
  paypal,
  bankTransfer,
  cash,
  wallet;

  String get displayName {
    switch (this) {
      case PaymentMethod.creditCard:
        return 'Credit Card';
      case PaymentMethod.debitCard:
        return 'Debit Card';
      case PaymentMethod.paypal:
        return 'PayPal';
      case PaymentMethod.bankTransfer:
        return 'Bank Transfer';
      case PaymentMethod.cash:
        return 'Cash';
      case PaymentMethod.wallet:
        return 'Digital Wallet';
    }
  }
}

class TransactionItem extends Equatable {
  final String productId;
  final String productName;
  final double unitPrice;
  final int quantity;
  final double subtotal;

  const TransactionItem({
    required this.productId,
    required this.productName,
    required this.unitPrice,
    required this.quantity,
    required this.subtotal,
  });

  factory TransactionItem.fromCartItem(CartItem cartItem) {
    return TransactionItem(
      productId: cartItem.product.id,
      productName: cartItem.product.name,
      unitPrice: cartItem.product.price,
      quantity: cartItem.quantity,
      subtotal: cartItem.totalPrice,
    );
  }

  @override
  List<Object?> get props => [productId, productName, unitPrice, quantity, subtotal];
}

class Transaction extends Equatable {
  final String id;
  final List<TransactionItem> items;
  final double totalAmount;
  final TransactionStatus status;
  final PaymentMethod paymentMethod;
  final String? customerId;
  final String? customerEmail;
  final String? shippingAddress;
  final String? trackingNumber;
  final String? failureReason;
  final DateTime createdAt;
  final DateTime? completedAt;
  final DateTime? cancelledAt;

  const Transaction({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.paymentMethod,
    this.customerId,
    this.customerEmail,
    this.shippingAddress,
    this.trackingNumber,
    this.failureReason,
    required this.createdAt,
    this.completedAt,
    this.cancelledAt,
  });

  factory Transaction.create({
    required String id,
    required Cart cart,
    required PaymentMethod paymentMethod,
    String? customerId,
    String? customerEmail,
    String? shippingAddress,
  }) {
    final transactionItems = cart.items.map((item) => TransactionItem.fromCartItem(item)).toList();
    
    return Transaction(
      id: id,
      items: transactionItems,
      totalAmount: cart.totalAmount,
      status: TransactionStatus.pending,
      paymentMethod: paymentMethod,
      customerId: customerId,
      customerEmail: customerEmail,
      shippingAddress: shippingAddress,
      createdAt: DateTime.now(),
    );
  }

  Transaction copyWith({
    String? id,
    List<TransactionItem>? items,
    double? totalAmount,
    TransactionStatus? status,
    PaymentMethod? paymentMethod,
    String? customerId,
    String? customerEmail,
    String? shippingAddress,
    String? trackingNumber,
    String? failureReason,
    DateTime? createdAt,
    DateTime? completedAt,
    DateTime? cancelledAt,
  }) {
    return Transaction(
      id: id ?? this.id,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      customerId: customerId ?? this.customerId,
      customerEmail: customerEmail ?? this.customerEmail,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      failureReason: failureReason ?? this.failureReason,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      cancelledAt: cancelledAt ?? this.cancelledAt,
    );
  }

  Transaction markAsProcessing() {
    if (!status.isPending) {
      throw StateError('Can only process pending transactions');
    }
    return copyWith(status: TransactionStatus.processing);
  }

  Transaction markAsCompleted({String? trackingNumber}) {
    if (!status.isProcessing) {
      throw StateError('Can only complete processing transactions');
    }
    return copyWith(
      status: TransactionStatus.completed,
      trackingNumber: trackingNumber,
      completedAt: DateTime.now(),
    );
  }

  Transaction markAsFailed(String reason) {
    if (status.isTerminal) {
      throw StateError('Cannot fail a terminal transaction');
    }
    return copyWith(
      status: TransactionStatus.failed,
      failureReason: reason,
      completedAt: DateTime.now(),
    );
  }

  Transaction cancel({String? reason}) {
    if (status.isTerminal) {
      throw StateError('Cannot cancel a terminal transaction');
    }
    return copyWith(
      status: TransactionStatus.cancelled,
      failureReason: reason,
      cancelledAt: DateTime.now(),
    );
  }

  Transaction refund() {
    if (!status.isCompleted) {
      throw StateError('Can only refund completed transactions');
    }
    return copyWith(status: TransactionStatus.refunded);
  }

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
  
  bool get canBeCancelled => !status.isTerminal;
  bool get canBeRefunded => status.isCompleted;
  bool get canBeProcessed => status.isPending;

  @override
  List<Object?> get props => [
        id,
        items,
        totalAmount,
        status,
        paymentMethod,
        customerId,
        customerEmail,
        shippingAddress,
        trackingNumber,
        failureReason,
        createdAt,
        completedAt,
        cancelledAt,
      ];

  @override
  String toString() {
    return 'Transaction(id: $id, status: ${status.displayName}, totalAmount: ${totalAmount.toStringAsFixed(2)}, itemCount: $itemCount)';
  }

  String get formattedTotal => '\$${totalAmount.toStringAsFixed(2)}';

  void validateForProcessing() {
    if (items.isEmpty) {
      throw ArgumentError('Transaction must have at least one item');
    }
    if (totalAmount <= 0) {
      throw ArgumentError('Transaction total amount must be greater than zero');
    }
    if (customerEmail != null && !_isValidEmail(customerEmail!)) {
      throw ArgumentError('Invalid customer email');
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
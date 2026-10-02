part of flutter_ecommerce_app;

enum TransactionStatusModel {
  pending,
  processing,
  completed,
  failed,
  cancelled,
  refunded;

  String get value {
    switch (this) {
      case TransactionStatusModel.pending:
        return 'pending';
      case TransactionStatusModel.processing:
        return 'processing';
      case TransactionStatusModel.completed:
        return 'completed';
      case TransactionStatusModel.failed:
        return 'failed';
      case TransactionStatusModel.cancelled:
        return 'cancelled';
      case TransactionStatusModel.refunded:
        return 'refunded';
    }
  }

  static TransactionStatusModel fromString(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return TransactionStatusModel.pending;
      case 'processing':
        return TransactionStatusModel.processing;
      case 'completed':
        return TransactionStatusModel.completed;
      case 'failed':
        return TransactionStatusModel.failed;
      case 'cancelled':
        return TransactionStatusModel.cancelled;
      case 'refunded':
        return TransactionStatusModel.refunded;
      default:
        return TransactionStatusModel.pending;
    }
  }
}

enum PaymentMethodModel {
  creditCard,
  debitCard,
  paypal,
  bankTransfer,
  cash;

  String get value {
    switch (this) {
      case PaymentMethodModel.creditCard:
        return 'credit_card';
      case PaymentMethodModel.debitCard:
        return 'debit_card';
      case PaymentMethodModel.paypal:
        return 'paypal';
      case PaymentMethodModel.bankTransfer:
        return 'bank_transfer';
      case PaymentMethodModel.cash:
        return 'cash';
    }
  }

  static PaymentMethodModel fromString(String method) {
    switch (method.toLowerCase()) {
      case 'credit_card':
        return PaymentMethodModel.creditCard;
      case 'debit_card':
        return PaymentMethodModel.debitCard;
      case 'paypal':
        return PaymentMethodModel.paypal;
      case 'bank_transfer':
        return PaymentMethodModel.bankTransfer;
      case 'cash':
        return PaymentMethodModel.cash;
      default:
        return PaymentMethodModel.creditCard;
    }
  }
}

class TransactionModel extends Transaction {
  const TransactionModel({
    required super.id,
    required super.userId,
    required super.items,
    required super.totalAmount,
    required super.status,
    required super.paymentMethod,
    required super.createdAt,
    super.completedAt,
    super.errorMessage,
    super.retryCount = 0,
    super.metadata,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    final itemsList = (json['items'] as List<dynamic>?)
            ?.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
            .toList() ??
        [];

    return TransactionModel(
      id: json['id'] as String,
      userId: json['user_id'] as String? ?? json['userId'] as String? ?? '',
      items: itemsList,
      totalAmount: (json['total_amount'] as num).toDouble() ?? (json['totalAmount'] as num).toDouble(),
      status: TransactionStatusModel.fromString(json['status'] as String? ?? 'pending'),
      paymentMethod: PaymentMethodModel.fromString(json['payment_method'] as String? ?? 'credit_card'),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : (json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now()),
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : (json['completedAt'] != null ? DateTime.parse(json['completedAt'] as String) : null),
      errorMessage: json['error_message'] as String? ?? json['errorMessage'] as String?,
      retryCount: json['retry_count'] as int? ?? json['retryCount'] as int? ?? 0,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'items': items.map((item) => CartItemModel.fromEntity(item).toJson()).toList(),
      'total_amount': totalAmount,
      'status': status.value,
      'payment_method': paymentMethod.value,
      'created_at': createdAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'error_message': errorMessage,
      'retry_count': retryCount,
      'metadata': metadata,
    };
  }

  factory TransactionModel.fromEntity(Transaction transaction) {
    return TransactionModel(
      id: transaction.id,
      userId: transaction.userId,
      items: transaction.items,
      totalAmount: transaction.totalAmount,
      status: _mapStatusToModel(transaction.status),
      paymentMethod: _mapPaymentMethodToModel(transaction.paymentMethod),
      createdAt: transaction.createdAt,
      completedAt: transaction.completedAt,
      errorMessage: transaction.errorMessage,
      retryCount: transaction.retryCount,
      metadata: transaction.metadata,
    );
  }

  Transaction toEntity() {
    return Transaction(
      id: id,
      userId: userId,
      items: items,
      totalAmount: totalAmount,
      status: _mapStatusFromModel(status),
      paymentMethod: _mapPaymentMethodFromModel(paymentMethod),
      createdAt: createdAt,
      completedAt: completedAt,
      errorMessage: errorMessage,
      retryCount: retryCount,
      metadata: metadata,
    );
  }

  static TransactionStatus _mapStatusToModel(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.pending:
        return TransactionStatusModel.pending;
      case TransactionStatus.processing:
        return TransactionStatusModel.processing;
      case TransactionStatus.completed:
        return TransactionStatusModel.completed;
      case TransactionStatus.failed:
        return TransactionStatusModel.failed;
      case TransactionStatus.cancelled:
        return TransactionStatusModel.cancelled;
      case TransactionStatus.refunded:
        return TransactionStatusModel.refunded;
    }
  }

  static TransactionStatus _mapStatusFromModel(TransactionStatusModel status) {
    switch (status) {
      case TransactionStatusModel.pending:
        return TransactionStatus.pending;
      case TransactionStatusModel.processing:
        return TransactionStatus.processing;
      case TransactionStatusModel.completed:
        return TransactionStatus.completed;
      case TransactionStatusModel.failed:
        return TransactionStatus.failed;
      case TransactionStatusModel.cancelled:
        return TransactionStatus.cancelled;
      case TransactionStatusModel.refunded:
        return TransactionStatus.refunded;
    }
  }

  static PaymentMethod _mapPaymentMethodToModel(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.creditCard:
        return PaymentMethodModel.creditCard;
      case PaymentMethod.debitCard:
        return PaymentMethodModel.debitCard;
      case PaymentMethod.paypal:
        return PaymentMethodModel.paypal;
      case PaymentMethod.bankTransfer:
        return PaymentMethodModel.bankTransfer;
      case PaymentMethod.cash:
        return PaymentMethodModel.cash;
    }
  }

  static PaymentMethod _mapPaymentMethodFromModel(PaymentMethodModel method) {
    switch (method) {
      case PaymentMethodModel.creditCard:
        return PaymentMethod.creditCard;
      case PaymentMethodModel.debitCard:
        return PaymentMethod.debitCard;
      case PaymentMethodModel.paypal:
        return PaymentMethod.paypal;
      case PaymentMethodModel.bankTransfer:
        return PaymentMethod.bankTransfer;
      case PaymentMethodModel.cash:
        return PaymentMethod.cash;
    }
  }

  TransactionModel copyWith({
    String? id,
    String? userId,
    List<CartItem>? items,
    double? totalAmount,
    TransactionStatusModel? status,
    PaymentMethodModel? paymentMethod,
    DateTime? createdAt,
    DateTime? completedAt,
    String? errorMessage,
    int? retryCount,
    Map<String, dynamic>? metadata,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      errorMessage: errorMessage ?? this.errorMessage,
      retryCount: retryCount ?? this.retryCount,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransactionModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'TransactionModel(id: $id, totalAmount: $totalAmount, status: ${status.value})';
  }
}

class CartItemModel extends CartItem {
  const CartItemModel({
    required super.productId,
    required super.productName,
    required super.quantity,
    required super.unitPrice,
    super.discount = 0.0,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['product_id'] as String? ?? json['productId'] as String? ?? '',
      productName: json['product_name'] as String? ?? json['productName'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 1,
      unitPrice: (json['unit_price'] as num).toDouble() ?? (json['unitPrice'] as num).toDouble(),
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_name': productName,
      'quantity': quantity,
      'unit_price': unitPrice,
      'discount': discount,
    };
  }

  factory CartItemModel.fromEntity(CartItem item) {
    return CartItemModel(
      productId: item.productId,
      productName: item.productName,
      quantity: item.quantity,
      unitPrice: item.unitPrice,
      discount: item.discount,
    );
  }

  double get totalPrice => (unitPrice * quantity) - discount;

  CartItemModel copyWith({
    String? productId,
    String? productName,
    int? quantity,
    double? unitPrice,
    double? discount,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      discount: discount ?? this.discount,
    );
  }
}
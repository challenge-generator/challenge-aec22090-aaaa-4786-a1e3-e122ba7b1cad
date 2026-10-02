library flutter_ecommerce_app.domain.entities.cart;

import 'package:equatable/equatable.dart';
import 'product.dart';

class CartItem extends Equatable {
  final String id;
  final Product product;
  final int quantity;
  final DateTime addedAt;

  const CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.addedAt,
  });

  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    DateTime? addedAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  double get totalPrice => product.price * quantity;

  @override
  List<Object?> get props => [id, product, quantity, addedAt];

  @override
  String toString() {
    return 'CartItem(id: $id, product: ${product.name}, quantity: $quantity, totalPrice: $totalPrice)';
  }

  void validateQuantity() {
    if (quantity <= 0) {
      throw ArgumentError('Cart item quantity must be greater than zero');
    }
    if (quantity > product.stock) {
      throw ArgumentError('Cannot add more items than available in stock');
    }
  }
}

class Cart extends Equatable {
  final String id;
  final List<CartItem> items;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Cart({
    required this.id,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cart.create({required String id}) {
    final now = DateTime.now();
    return Cart(
      id: id,
      items: const [],
      createdAt: now,
      updatedAt: now,
    );
  }

  Cart copyWith({
    String? id,
    List<CartItem>? items,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Cart(
      id: id ?? this.id,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  Cart addItem(Product product, int quantity, String itemId) {
    final existingIndex = items.indexWhere((item) => item.product.id == product.id);
    
    if (existingIndex >= 0) {
      final existingItem = items[existingIndex];
      final newQuantity = existingItem.quantity + quantity;
      
      if (newQuantity > product.stock) {
        throw ArgumentError('Cannot exceed available stock for product: ${product.name}');
      }
      
      final updatedItem = existingItem.copyWith(quantity: newQuantity);
      final updatedItems = List<CartItem>.from(items);
      updatedItems[existingIndex] = updatedItem;
      
      return copyWith(items: updatedItems);
    }
    
    final newItem = CartItem(
      id: itemId,
      product: product,
      quantity: quantity,
      addedAt: DateTime.now(),
    );
    
    return copyWith(items: [...items, newItem]);
  }

  Cart removeItem(String productId) {
    final updatedItems = items.where((item) => item.product.id != productId).toList();
    return copyWith(items: updatedItems);
  }

  Cart updateQuantity(String productId, int newQuantity) {
    if (newQuantity <= 0) {
      return removeItem(productId);
    }
    
    final index = items.indexWhere((item) => item.product.id == productId);
    if (index < 0) {
      throw ArgumentError('Product not found in cart: $productId');
    }
    
    final item = items[index];
    if (newQuantity > item.product.stock) {
      throw ArgumentError('Cannot exceed available stock for product: ${item.product.name}');
    }
    
    final updatedItem = item.copyWith(quantity: newQuantity);
    final updatedItems = List<CartItem>.from(items);
    updatedItems[index] = updatedItem;
    
    return copyWith(items: updatedItems);
  }

  Cart clear() {
    return copyWith(items: []);
  }

  double get totalAmount {
    if (items.isEmpty) return 0.0;
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  int get itemCount {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  int get uniqueItemCount => items.length;

  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;

  bool containsProduct(String productId) {
    return items.any((item) => item.product.id == productId);
  }

  CartItem? getItem(String productId) {
    try {
      return items.firstWhere((item) => item.product.id == productId);
    } catch (_) {
      return null;
    }
  }

  @override
  List<Object?> get props => [id, items, createdAt, updatedAt];

  @override
  String toString() {
    return 'Cart(id: $id, itemCount: $itemCount, totalAmount: ${totalAmount.toStringAsFixed(2)})';
  }

  String get formattedTotal => '\$${totalAmount.toStringAsFixed(2)}';
}
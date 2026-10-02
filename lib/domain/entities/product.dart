library flutter_ecommerce_app.domain.entities.product;

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;
  final String sku;
  final bool isAvailable;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    required this.sku,
    required this.isAvailable,
    required this.createdAt,
    required this.updatedAt,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    int? stock,
    String? sku,
    bool? isAvailable,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      stock: stock ?? this.stock,
      sku: sku ?? this.sku,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        category,
        stock,
        sku,
        isAvailable,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, category: $category, stock: $stock, isAvailable: $isAvailable)';
  }

  bool get hasStock => stock > 0;
  bool get isLowStock => stock > 0 && stock <= 5;
  bool get isOutOfStock => stock <= 0;

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';

  void validate() {
    if (id.isEmpty) {
      throw ArgumentError('Product id cannot be empty');
    }
    if (name.isEmpty) {
      throw ArgumentError('Product name cannot be empty');
    }
    if (price < 0) {
      throw ArgumentError('Product price cannot be negative');
    }
    if (stock < 0) {
      throw ArgumentError('Product stock cannot be negative');
    }
    if (sku.isEmpty) {
      throw ArgumentError('Product SKU cannot be empty');
    }
  }
}
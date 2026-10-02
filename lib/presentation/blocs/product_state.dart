part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final bool hasReachedMax;
  final int currentPage;
  final String? categoryId;
  final String? searchQuery;

  const ProductLoaded({
    required this.products,
    this.hasReachedMax = false,
    this.currentPage = 1,
    this.categoryId,
    this.searchQuery,
  });

  @override
  List<Object?> get props => [
        products,
        hasReachedMax,
        currentPage,
        categoryId,
        searchQuery,
      ];

  ProductLoaded copyWith({
    List<Product>? products,
    bool? hasReachedMax,
    int? currentPage,
    String? categoryId,
    String? searchQuery,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      categoryId: categoryId ?? this.categoryId,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class ProductError extends ProductState {
  final String message;
  final int? code;

  const ProductError({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];
}
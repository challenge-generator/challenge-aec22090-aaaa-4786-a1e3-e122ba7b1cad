part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent {
  final int? page;
  final int? pageSize;
  final String? categoryId;

  const LoadProducts({
    this.page = 1,
    this.pageSize = 20,
    this.categoryId,
  });

  @override
  List<Object?> get props => [page, pageSize, categoryId];
}

class RefreshProducts extends ProductEvent {
  const RefreshProducts();
}

class FilterProducts extends ProductEvent {
  final String? categoryId;
  final double? minPrice;
  final double? maxPrice;
  final bool? inStock;

  const FilterProducts({
    this.categoryId,
    this.minPrice,
    this.maxPrice,
    this.inStock,
  });

  @override
  List<Object?> get props => [categoryId, minPrice, maxPrice, inStock];
}

class SearchProducts extends ProductEvent {
  final String query;

  const SearchProducts(this.query);

  @override
  List<Object?> get props => [query];
}

class LoadMoreProducts extends ProductEvent {
  const LoadMoreProducts();
}
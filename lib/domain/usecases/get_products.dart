library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/errors/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

abstract class GetProducts {
  Future<Either<Failure, List<Product>>> call({
    GetProductsParams? params,
  });
}

class GetProductsImpl implements GetProducts {
  final ProductRepository repository;

  GetProductsImpl({required this.repository});

  @override
  Future<Either<Failure, List<Product>>> call({
    GetProductsParams? params,
  }) async {
    final effectiveParams = params ?? const GetProductsParams();

    final result = await repository.getProducts(
      page: effectiveParams.page,
      limit: effectiveParams.limit,
      category: effectiveParams.category,
      searchQuery: effectiveParams.searchQuery,
      sortBy: effectiveParams.sortBy,
      ascending: effectiveParams.ascending,
    );

    return result.fold(
      (failure) => Left(failure),
      (products) {
        if (effectiveParams.minPrice != null) {
          final filtered = products
              .where((p) => p.price >= effectiveParams.minPrice!)
              .toList();
          return Right(filtered);
        }
        if (effectiveParams.maxPrice != null) {
          final filtered = products
              .where((p) => p.price <= effectiveParams.maxPrice!)
              .toList();
          return Right(filtered);
        }
        if (effectiveParams.inStockOnly == true) {
          final filtered = products.where((p) => p.stock > 0).toList();
          return Right(filtered);
        }
        return Right(products);
      },
    );
  }
}

class GetProductsParams extends Equatable {
  final int page;
  final int limit;
  final String? category;
  final String? searchQuery;
  final String? sortBy;
  final bool ascending;
  final double? minPrice;
  final double? maxPrice;
  final bool? inStockOnly;

  const GetProductsParams({
    this.page = 1,
    this.limit = 20,
    this.category,
    this.searchQuery,
    this.sortBy,
    this.ascending = true,
    this.minPrice,
    this.maxPrice,
    this.inStockOnly,
  });

  @override
  List<Object?> get props => [
        page,
        limit,
        category,
        searchQuery,
        sortBy,
        ascending,
        minPrice,
        maxPrice,
        inStockOnly,
      ];

  GetProductsParams copyWith({
    int? page,
    int? limit,
    String? category,
    String? searchQuery,
    String? sortBy,
    bool? ascending,
    double? minPrice,
    double? maxPrice,
    bool? inStockOnly,
  }) {
    return GetProductsParams(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      category: category ?? this.category,
      searchQuery: searchQuery ?? this.searchQuery,
      sortBy: sortBy ?? this.sortBy,
      ascending: ascending ?? this.ascending,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      inStockOnly: inStockOnly ?? this.inStockOnly,
    );
  }

  bool get hasFilters =>
      category != null ||
      searchQuery != null ||
      minPrice != null ||
      maxPrice != null ||
      inStockOnly == true;

  Map<String, dynamic> toQueryParams() {
    return {
      'page': page,
      'limit': limit,
      if (category != null) 'category': category,
      if (searchQuery != null) 'q': searchQuery,
      if (sortBy != null) 'sort': sortBy,
      if (!ascending) 'order': 'desc',
      if (minPrice != null) 'min_price': minPrice,
      if (maxPrice != null) 'max_price': maxPrice,
      if (inStockOnly == true) 'in_stock': 'true',
    };
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/get_products.dart';
import '../../../core/errors/failures.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  final String _searchQuery = '';
  final List<Product> _allProducts = [];

  ProductBloc({required this.getProducts}) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<RefreshProducts>(_onRefreshProducts);
    on<FilterProducts>(_onFilterProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final Either<Failure, List<Product>> result = await getProducts(
        GetProductsParams(
          page: event.page ?? 1,
          pageSize: event.pageSize ?? 20,
          categoryId: event.categoryId,
        ),
      );
      result.fold(
        (Failure failure) => emit(ProductError(
          message: failure.message,
          code: failure.code,
        )),
        (List<Product> products) {
          _allProducts.clear();
          _allProducts.addAll(products);
          emit(ProductLoaded(
            products: products,
            hasReachedMax: products.length < (event.pageSize ?? 20),
            currentPage: event.page ?? 1,
          ));
        },
      );
    } catch (e) {
      emit(ProductError(
        message: 'Error al cargar productos: ${e.toString()}',
        code: 500,
      ));
    }
  }

  Future<void> _onRefreshProducts(
    RefreshProducts event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final Either<Failure, List<Product>> result = await getProducts(
        GetProductsParams(page: 1, pageSize: 20),
      );
      result.fold(
        (Failure failure) => emit(ProductError(
          message: failure.message,
          code: failure.code,
        )),
        (List<Product> products) {
          _allProducts.clear();
          _allProducts.addAll(products);
          emit(ProductLoaded(
            products: products,
            hasReachedMax: false,
            currentPage: 1,
          ));
        },
      );
    } catch (e) {
      emit(ProductError(
        message: 'Error al actualizar productos: ${e.toString()}',
        code: 500,
      ));
    }
  }

  void _onFilterProducts(
    FilterProducts event,
    Emitter<ProductState> emit,
  ) {
    if (_allProducts.isEmpty) return;
    
    List<Product> filtered;
    if (event.categoryId == null) {
      filtered = _allProducts;
    } else {
      filtered = _allProducts
          .where((p) => p.categoryId == event.categoryId)
          .toList();
    }
    
    if (event.minPrice != null) {
      filtered = filtered.where((p) => p.price >= event.minPrice!).toList();
    }
    if (event.maxPrice != null) {
      filtered = filtered.where((p) => p.price <= event.maxPrice!).toList();
    }
    
    emit(ProductLoaded(
      products: filtered,
      hasReachedMax: true,
      currentPage: 1,
      categoryId: event.categoryId,
    ));
  }

  void _onSearchProducts(
    SearchProducts event,
    Emitter<ProductState> emit,
  ) {
    if (_allProducts.isEmpty) return;
    
    final query = event.query.toLowerCase();
    final filtered = _allProducts.where((p) {
      return p.name.toLowerCase().contains(query) ||
          p.description.toLowerCase().contains(query);
    }).toList();
    
    emit(ProductLoaded(
      products: filtered,
      hasReachedMax: true,
      currentPage: 1,
      searchQuery: event.query,
    ));
  }
}
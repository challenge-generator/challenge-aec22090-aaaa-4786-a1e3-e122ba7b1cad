library flutter_ecommerce_app.domain.repositories.product_repository;

import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts({
    int page = 1,
    int pageSize = 20,
  });

  Future<Either<Failure, Product>> getProductById(String id);

  Future<Either<Failure, List<Product>>> searchProducts(String query);

  Future<Either<Failure, List<Product>>> getProductsByCategory(
    String category, {
    int page = 1,
    int pageSize = 20,
  });

  Future<Either<Failure, List<String>>> getCategories();

  Future<Either<Failure, Product>> updateProductStock(
    String productId,
    int quantityChange,
  );

  Future<Either<Failure, List<Product>>> getFeaturedProducts();

  Future<Either<Failure, List<Product>>> getProductsByIds(List<String> ids);

  Future<Either<Failure, bool>> checkProductAvailability(
    String productId,
    int requestedQuantity,
  );
}
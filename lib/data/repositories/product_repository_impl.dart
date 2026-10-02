package flutter_ecommerce_app.data.repositories;

import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/errors/exceptions.dart';
import 'package:flutter_ecommerce_app/core/errors/failures.dart';
import 'package:flutter_ecommerce_app/domain/entities/product.dart';
import 'package:flutter_ecommerce_app/domain/repositories/product_repository.dart';
import 'package:flutter_ecommerce_app/data/datasources/product_remote_datasource.dart';
import 'package:flutter_ecommerce_app/data/models/product_model.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  
  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final productModels = await remoteDataSource.fetchProducts();
      final products = productModels.map((model) => model.toEntity()).toList();
      return Right(products);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on InvalidDataException catch (e) {
      return Left(InvalidDataFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    if (id.isEmpty) {
      return const Left(InvalidDataFailure('Product ID cannot be empty'));
    }
    
    try {
      final productModel = await remoteDataSource.fetchProductById(id);
      return Right(productModel.toEntity());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on InvalidDataException catch (e) {
      return Left(InvalidDataFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> searchProducts(String query) async {
    if (query.isEmpty) {
      return const Left(InvalidDataFailure('Search query cannot be empty'));
    }
    
    try {
      final allProducts = await remoteDataSource.fetchProducts();
      final filteredProducts = allProducts.where((product) {
        final lowercaseQuery = query.toLowerCase();
        return product.name.toLowerCase().contains(lowercaseQuery) ||
               product.description.toLowerCase().contains(lowercaseQuery) ||
               product.category.toLowerCase().contains(lowercaseQuery);
      }).toList();
      
      final products = filteredProducts.map((model) => model.toEntity()).toList();
      return Right(products);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category) async {
    if (category.isEmpty) {
      return const Left(InvalidDataFailure('Category cannot be empty'));
    }
    
    try {
      final allProducts = await remoteDataSource.fetchProducts();
      final filteredProducts = allProducts.where((product) {
        return product.category.toLowerCase() == category.toLowerCase();
      }).toList();
      
      final products = filteredProducts.map((model) => model.toEntity()).toList();
      return Right(products);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }
}
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/domain/usecases/get_products.dart';
import 'package:flutter_ecommerce_app/domain/repositories/product_repository.dart';
import 'package:flutter_ecommerce_app/domain/entities/product.dart';
import 'package:flutter_ecommerce_app/core/errors/failures.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late GetProducts useCase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    useCase = GetProducts(mockRepository);
  });

  group('GetProducts', () {
    final testProducts = [
      const Product(
        id: '1',
        name: 'Product One',
        description: 'Description One',
        price: 29.99,
        imageUrl: 'https://example.com/1.jpg',
        category: 'electronics',
        stock: 5,
      ),
      const Product(
        id: '2',
        name: 'Product Two',
        description: 'Description Two',
        price: 49.99,
        imageUrl: 'https://example.com/2.jpg',
        category: 'electronics',
        stock: 8,
      ),
    ];

    test.skip('should get products from repository', () async {
      when(() => mockRepository.getProducts(page: any(named: 'page'), limit: any(named: 'limit')))
          .thenAnswer((_) async => Right(testProducts));

      final result = await useCase(const GetProductsParams());

      expect(result, Right(testProducts));
      verify(() => mockRepository.getProducts(page: 1, limit: 20)).called(1);
    });

    test.skip('should return failure when repository fails', () async {
      when(() => mockRepository.getProducts(page: any(named: 'page'), limit: any(named: 'limit')))
          .thenAnswer((_) async => const Left(NetworkFailure('Network error')));

      final result = await useCase(const GetProductsParams());

      expect(result.isLeft(), true);
    });

    test.skip('should get products with custom pagination', () async {
      when(() => mockRepository.getProducts(page: 2, limit: 50))
          .thenAnswer((_) async => Right(testProducts));

      final result = await useCase(const GetProductsParams(page: 2, limit: 50));

      expect(result.isRight(), true);
      verify(() => mockRepository.getProducts(page: 2, limit: 50)).called(1);
    });

    test.skip('should return empty list when no products available', () async {
      when(() => mockRepository.getProducts(page: any(named: 'page'), limit: any(named: 'limit')))
          .thenAnswer((_) async => const Right([]));

      final result = await useCase(const GetProductsParams());

      expect(result.isRight(), true);
      final products = result.getOrElse(() => []);
      expect(products, isEmpty);
    });
  });
}
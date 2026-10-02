import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/domain/repositories/product_repository.dart';
import 'package:flutter_ecommerce_app/domain/entities/product.dart';
import 'package:flutter_ecommerce_app/core/errors/failures.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
  });

  group('ProductRepository', () {
    final testProducts = [
      const Product(
        id: '1',
        name: 'Test Product',
        description: 'Test Description',
        price: 99.99,
        imageUrl: 'https://example.com/image.jpg',
        category: 'electronics',
        stock: 10,
      ),
    ];

    test.skip('getProducts should return list of products on success', () async {
      when(() => mockRepository.getProducts(page: any(named: 'page'), limit: any(named: 'limit')))
          .thenAnswer((_) async => Right(testProducts));

      final result = await mockRepository.getProducts();

      expect(result.isRight(), true);
    });

    test.skip('getProducts should return failure on network error', () async {
      when(() => mockRepository.getProducts(page: any(named: 'page'), limit: any(named: 'limit')))
          .thenAnswer((_) async => const Left(NetworkFailure('Network error')));

      final result = await mockRepository.getProducts();

      expect(result.isLeft(), true);
    });

    test.skip('getProductById should return product on success', () async {
      when(() => mockRepository.getProductById('1'))
          .thenAnswer((_) async => Right(testProducts.first));

      final result = await mockRepository.getProductById('1');

      expect(result.isRight(), true);
    });

    test.skip('getProductById should return failure when product not found', () async {
      when(() => mockRepository.getProductById('999'))
          .thenAnswer((_) async => const Left(InvalidDataFailure('Product not found')));

      final result = await mockRepository.getProductById('999');

      expect(result.isLeft(), true);
    });

    test.skip('searchProducts should return filtered products', () async {
      when(() => mockRepository.searchProducts('test'))
          .thenAnswer((_) async => Right(testProducts));

      final result = await mockRepository.searchProducts('test');

      expect(result.isRight(), true);
    });
  });
}
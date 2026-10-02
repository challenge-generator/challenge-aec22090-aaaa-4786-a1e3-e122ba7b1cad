library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../entities/cart.dart';
import '../entities/product.dart';

abstract class AddToCart {
  Future<Either<Failure, Cart>> call(AddToCartParams params);
}

class AddToCartImpl implements AddToCart {
  AddToCartImpl();

  @override
  Future<Either<Failure, Cart>> call(AddToCartParams params) async {
    try {
      if (params.product == null && params.productId == null) {
        return const Left(InvalidDataFailure('Producto no proporcionado'));
      }

      if (params.quantity == null || params.quantity! <= 0) {
        return const Left(
          InvalidDataFailure('La cantidad debe ser mayor a cero'),
        );
      }

      if (params.quantity! > AppConstants.maxItemsPerCart) {
        return Left(LimitExceededFailure(
          AppConstants.cartLimitReachedMessage,
        ));
      }

      final existingCart = _getExistingCart(params.userId);

      if (existingCart == null) {
        return const Left(CartFailure('Carrito no encontrado'));
      }

      final existingItemIndex = existingCart.items
          .indexWhere((item) => item.productId == params.productId);

      int newTotalItems = existingCart.totalItems;
      double newTotalPrice = existingCart.totalPrice;

      if (existingItemIndex >= 0) {
        final existingItem = existingCart.items[existingItemIndex];
        final newQuantity = existingItem.quantity + params.quantity!;

        if (newQuantity > AppConstants.maxItemsPerCart) {
          return Left(LimitExceededFailure(
            AppConstants.cartLimitReachedMessage,
          ));
        }

        final priceDifference =
            (params.product?.price ?? 0) * params.quantity!;
        newTotalItems += params.quantity!;
        newTotalPrice += priceDifference;
      } else {
        newTotalItems += params.quantity!;
        newTotalPrice += (params.product?.price ?? 0) * params.quantity!;
      }

      final updatedCart = existingCart.copyWith(
        totalItems: newTotalItems,
        totalPrice: newTotalPrice,
        updatedAt: DateTime.now(),
      );

      return Right(updatedCart);
    } on CacheException catch (e) {
      return Left(CartFailure('Error al acceder al carrito: ${e.message}'));
    } on ValidationException catch (e) {
      return Left(InvalidDataFailure(e.errors.join(', ')));
    } catch (e) {
      return Left(GenericFailure('Error inesperado al agregar al carrito: $e'));
    }
  }

  Cart? _getExistingCart(String userId) {
    return null;
  }
}

class AddToCartParams extends Equatable {
  final String userId;
  final String? productId;
  final Product? product;
  final int? quantity;
  final Map<String, dynamic>? customAttributes;

  const AddToCartParams({
    required this.userId,
    this.productId,
    this.product,
    this.quantity,
    this.customAttributes,
  });

  @override
  List<Object?> get props => [
        userId,
        productId,
        product,
        quantity,
        customAttributes,
      ];

  AddToCartParams copyWith({
    String? userId,
    String? productId,
    Product? product,
    int? quantity,
    Map<String, dynamic>? customAttributes,
  }) {
    return AddToCartParams(
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      customAttributes: customAttributes ?? this.customAttributes,
    );
  }

  void validate() {
    final errors = <String>[];

    if (userId.isEmpty) {
      errors.add('El ID de usuario es requerido');
    }

    if (productId == null && product == null) {
      errors.add('Se debe proporcionar un producto o ID de producto');
    }

    if (quantity == null || quantity! <= 0) {
      errors.add('La cantidad debe ser mayor a cero');
    }

    if (quantity != null && quantity! > AppConstants.maxItemsPerCart) {
      errors.add(
        'La cantidad no puede exceder ${AppConstants.maxItemsPerCart} artículos',
      );
    }

    if (errors.isNotEmpty) {
      throw ValidationException(
        'Validación de agregar al carrito fallida',
        errors,
      );
    }
  }
}
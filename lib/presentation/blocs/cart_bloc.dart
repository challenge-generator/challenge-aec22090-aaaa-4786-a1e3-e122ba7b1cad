import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/cart.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/add_to_cart.dart';
import '../../../core/errors/failures.dart';
import '../../../core/constants/app_constants.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCart addToCart;
  final Cart _cart = Cart(items: [], total: 0.0);

  CartBloc({required this.addToCart}) : super(CartInitial()) {
    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveProductFromCart>(_onRemoveProductFromCart);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
    on<ClearCart>(_onClearCart);
    on<LoadCart>(_onLoadCart);
    on<ApplyCoupon>(_onApplyCoupon);
  }

  Future<void> _onAddProductToCart(
    AddProductToCart event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    try {
      if (_cart.items.length >= AppConstants.maxItemsPerCart) {
        emit(CartError(
          message: AppConstants.cartLimitReachedMessage,
          code: 400,
        ));
        return;
      }
      
      final existingIndex = _cart.items.indexWhere(
        (item) => item.product.id == event.product.id,
      );
      
      if (existingIndex >= 0) {
        final updatedItems = List<CartItem>.from(_cart.items);
        updatedItems[existingIndex] = CartItem(
          product: event.product,
          quantity: updatedItems[existingIndex].quantity + 1,
        );
        _cart.items = updatedItems;
        _cart.total = _calculateTotal(updatedItems);
      } else {
        _cart.items.add(CartItem(product: event.product, quantity: 1));
        _cart.total = _calculateTotal(_cart.items);
      }
      
      emit(CartLoaded(cart: _cart));
    } catch (e) {
      emit(CartError(
        message: 'Error al agregar al carrito: ${e.toString()}',
        code: 500,
      ));
    }
  }

  void _onRemoveProductFromCart(
    RemoveProductFromCart event,
    Emitter<CartState> emit,
  ) {
    if (_cart.items.isEmpty) return;
    
    _cart.items.removeWhere((item) => item.product.id == event.productId);
    _cart.total = _calculateTotal(_cart.items);
    emit(CartLoaded(cart: _cart));
  }

  void _onUpdateCartItemQuantity(
    UpdateCartItemQuantity event,
    Emitter<CartState> emit,
  ) {
    if (_cart.items.isEmpty) return;
    
    final index = _cart.items.indexWhere(
      (item) => item.product.id == event.productId,
    );
    
    if (index >= 0) {
      if (event.quantity <= 0) {
        _cart.items.removeAt(index);
      } else {
        final updatedItems = List<CartItem>.from(_cart.items);
        updatedItems[index] = CartItem(
          product: _cart.items[index].product,
          quantity: event.quantity,
        );
        _cart.items = updatedItems;
      }
      _cart.total = _calculateTotal(_cart.items);
      emit(CartLoaded(cart: _cart));
    }
  }

  void _onClearCart(
    ClearCart event,
    Emitter<CartState> emit,
  ) {
    _cart.items.clear();
    _cart.total = 0.0;
    _cart.appliedCoupon = null;
    emit(CartLoaded(cart: _cart));
  }

  void _onLoadCart(
    LoadCart event,
    Emitter<CartState> emit,
  ) {
    emit(CartLoaded(cart: _cart));
  }

  void _onApplyCoupon(
    ApplyCoupon event,
    Emitter<CartState> emit,
  ) {
    if (_cart.items.isEmpty) {
      emit(CartError(
        message: 'No hay productos en el carrito',
        code: 400,
      ));
      return;
    }
    
    // Simulación de validación de cupón
    final discount = _validateCoupon(event.couponCode);
    if (discount > 0) {
      final discountedTotal = _cart.total * (1 - discount);
      _cart.total = discountedTotal;
      _cart.appliedCoupon = event.couponCode;
      emit(CartLoaded(cart: _cart));
    } else {
      emit(CartError(
        message: 'Cupón inválido o expirado',
        code: 400,
      ));
    }
  }

  double _calculateTotal(List<CartItem> items) {
    return items.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  double _validateCoupon(String code) {
    // Simulación de validación de cupón
    if (code.toUpperCase() == 'DESCUENTO10') {
      return 0.10;
    } else if (code.toUpperCase() == 'DESCUENTO20') {
      return 0.20;
    }
    return 0.0;
  }
}
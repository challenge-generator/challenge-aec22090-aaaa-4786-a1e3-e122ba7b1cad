part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final Cart cart;

  const CartLoaded({required this.cart});

  @override
  List<Object?> get props => [cart];

  int get itemCount => cart.items.length;
  
  double get subtotal => cart.total;
  
  double get discount => cart.appliedCoupon != null ? _calculateDiscount() : 0.0;
  
  double get total => cart.total;
  
  double _calculateDiscount() {
    if (cart.appliedCoupon == 'DESCUENTO10') {
      return cart.total * 0.10;
    } else if (cart.appliedCoupon == 'DESCUENTO20') {
      return cart.total * 0.20;
    }
    return 0.0;
  }
}

class CartError extends CartState {
  final String message;
  final int? code;

  const CartError({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];
}
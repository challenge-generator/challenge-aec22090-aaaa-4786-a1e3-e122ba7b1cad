import 'package:gherkin/gherkin.dart';
import 'package:flutter_ecommerce_app/domain/entities/cart.dart';
import 'package:flutter_ecommerce_app/domain/entities/product.dart';
import 'package:flutter_ecommerce_app/domain/repositories/product_repository.dart';
import '../test_helpers.dart';

final cartSteps = <StepDefinitionGeneric>[
  when1<String>(
    RegExp(r'el usuario agrega el producto (\w+) al carrito'),
    (String productName, StepContext context) async {
      // Superficie de práctica: el estudiante implementa este paso
      // Debe obtener el producto del repositorio y agregarlo al carrito
      final world = context.world as AppWorld;
      final productRepo = world.get<ProductRepository>();
      // TODO: Obtener producto por nombre y llamar a addToCart
    },
  ),

  then1<int>(
    RegExp(r'el carrito contiene (\d+) elementos'),
    (int expectedCount, StepContext context) async {
      // Superficie de práctica: verificar cantidad de elementos
      final world = context.world as AppWorld;
      // TODO: Comparar con la cantidad real en el estado del carrito
    },
  ),

  when1<int>(
    RegExp(r'el usuario elimina (\d+) elementos del carrito'),
    (int count, StepContext context) async {
      // Superficie de práctica: eliminar elementos del carrito
      // TODO: Implementar lógica de eliminación
    },
  ),

  then0(
    RegExp(r'el carrito está vacío'),
    (StepContext context) async {
      // Superficie de práctica: verificar carrito vacío
      final world = context.world as AppWorld;
      // TODO: Verificar que el carrito no tiene elementos
    },
  ),

  when0(
    RegExp(r'el usuario vacía el carrito'),
    (StepContext context) async {
      // Superficie de práctica: vaciar carrito
      // TODO: Implementar limpieza del carrito
    },
  ),

  then1<double>(
    RegExp(r'el total del carrito es \$?(\d+\.?\d*)'),
    (double expectedTotal, StepContext context) async {
      // Superficie de práctica: verificar total
      // TODO: Calcular y comparar totales
    },
  ),

  when1<String>(
    RegExp(r'el usuario actualiza la cantidad del producto (\w+) a (\d+)'),
    (String productName, int quantity, StepContext context) async {
      // Superficie de práctica: actualizar cantidad
      // TODO: Buscar producto y actualizar cantidad
    },
  ),

  then0(
    RegExp(r'se muestra mensaje de límite alcanzado'),
    (StepContext context) async {
      // Superficie de práctica: verificar mensaje de límite
      // TODO: Verificar que aparece el mensaje de límite
    },
  ),
];
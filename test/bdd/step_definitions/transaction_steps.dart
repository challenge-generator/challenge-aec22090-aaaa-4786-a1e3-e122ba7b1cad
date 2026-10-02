import 'package:gherkin/gherkin.dart';
import 'package:flutter_ecommerce_app/domain/entities/transaction.dart';
import 'package:flutter_ecommerce_app/domain/entities/cart.dart';
import 'package:flutter_ecommerce_app/domain/repositories/transaction_repository.dart';
import '../test_helpers.dart';

final transactionSteps = <StepDefinitionGeneric>[
  given1<String>(
    RegExp(r'existe una transacción con estado (\w+)'),
    (String status, StepContext context) async {
      // Superficie de práctica: crear transacción con estado
      final world = context.world as AppWorld;
      final transactionRepo = world.get<TransactionRepository>();
      // TODO: Crear transacción mock con el estado dado
    },
  ),

  when1<String>(
    RegExp(r'el usuario inicia el proceso de checkout'),
    (String _, StepContext context) async {
      // Superficie de práctica: iniciar checkout
      // TODO: Simular inicio del proceso de checkout
    },
  ),

  when1<String>(
    RegExp(r'el usuario selecciona método de pago (\w+)'),
    (String paymentMethod, StepContext context) async {
      // Superficie de práctica: seleccionar método de pago
      // TODO: Seleccionar método de pago válido
    },
  ),

  then1<String>(
    RegExp(r'la transacción tiene estado (\w+)'),
    (String expectedStatus, StepContext context) async {
      // Superficie de práctica: verificar estado de transacción
      final world = context.world as AppWorld;
      // TODO: Obtener transacción actual y comparar estado
    },
  ),

  when0(
    RegExp(r'el usuario confirma la transacción'),
    (StepContext context) async {
      // Superficie de práctica: confirmar transacción
      // TODO: Llamar a proceso de transacción
    },
  ),

  then0(
    RegExp(r'la transacción se procesa exitosamente'),
    (StepContext context) async {
      // Superficie de práctica: verificar éxito
      // TODO: Verificar que la transacción fue exitosa
    },
  ),

  then1<String>(
    RegExp(r'se muestra mensaje de error: (\w+)'),
    (String errorType, StepContext context) async {
      // Superficie de práctica: verificar mensaje de error
      // TODO: Verificar que aparece el tipo de error correcto
    },
  ),

  when1<double>(
    RegExp(r'el monto de la transacción es \$?(\d+\.?\d*)'),
    (double amount, StepContext context) async {
      // Superficie de práctica: configurar monto
      final world = context.world as AppWorld;
      // TODO: Establecer monto para la transacción
    },
  ),

  then0(
    RegExp(r'la transacción cumple con el monto mínimo'),
    (StepContext context) async {
      // Superficie de práctica: verificar monto mínimo
      // TODO: Validar que el monto sea mayor al mínimo permitido
    },
  ),

  when0(
    RegExp(r'el usuario cancela la transacción'),
    (StepContext context) async {
      // Superficie de práctica: cancelar transacción
      // TODO: Cancelar transacción en proceso
    },
  ),
];
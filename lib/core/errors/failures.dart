import 'package:equatable/equatable.dart';

/// Clase base para todos los fallos en la aplicación.
/// Proporciona manejo de errores tipado usando el patrón Either de dartz.
abstract class Failure extends Equatable {
  final String message;
  final int? code;
  final StackTrace? stackTrace;

  const Failure(this.message, {this.code, this.stackTrace});

  @override
  List<Object?> get props => [message, code, stackTrace];

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

/// Fallo por error de conexión de red
class NetworkFailure extends Failure {
  const NetworkFailure({String message = 'Network connection failed'})
      : super(message, code: 1001);
}

/// Fallo por timeout en la conexión
class TimeoutFailure extends Failure {
  const TimeoutFailure({String message = 'Connection timeout'})
      : super(message, code: 1002);
}

/// Fallo por respuesta inválida del servidor
class InvalidResponseFailure extends Failure {
  const InvalidResponseFailure({String message = 'Invalid server response'})
      : super(message, code: 1003);
}

/// Fallo por error en el servidor
class ServerFailure extends Failure {
  final Map<String, dynamic>? errorData;

  const ServerFailure({
    String message = 'Server error',
    this.errorData,
  }) : super(message, code: 1004);

  @override
  List<Object?> get props => [...super.props, errorData];
}

/// Fallo por datos inválidos en la capa de aplicación
class InvalidDataFailure extends Failure {
  const InvalidDataFailure({String message = 'Invalid data provided'})
      : super(message, code: 1005);
}

/// Fallo por estado de carrito inválido
class CartFailure extends Failure {
  const CartFailure({String message = 'Cart operation failed'})
      : super(message, code: 2001);
}

/// Fallo por transacción inválida
class TransactionFailure extends Failure {
  const TransactionFailure({String message = 'Transaction failed'})
      : super(message, code: 2002);
}

/// Fallo por autenticación requerida
class AuthenticationFailure extends Failure {
  const AuthenticationFailure({String message = 'Authentication required'})
      : super(message, code: 3001);
}

/// Fallo por falta de permisos
class PermissionFailure extends Failure {
  const PermissionFailure({String message = 'Permission denied'})
      : super(message, code: 3002);
}

/// Fallo por límite excedido
class LimitExceededFailure extends Failure {
  const LimitExceededFailure({String message = 'Limit exceeded'})
      : super(message, code: 4001);
}

/// Fallo genérico para casos no cubiertos
class GenericFailure extends Failure {
  const GenericFailure({String message = 'An error occurred'})
      : super(message, code: 9999);
}

/// Extensión para convertir excepciones a fallos
extension FailureX on Exception {
  Failure toFailure() {
    if (this is NetworkException) {
      return NetworkFailure(message: (this as NetworkException).message);
    } else if (this is TimeoutException) {
      return TimeoutFailure(message: (this as TimeoutException).message);
    } else if (this is ServerException) {
      return ServerFailure(
        message: (this as ServerException).message,
        errorData: (this as ServerException).errorData,
      );
    } else if (this is InvalidDataException) {
      return InvalidDataFailure(message: (this as InvalidDataException).message);
    } else {
      return GenericFailure(message: toString());
    }
  }
}
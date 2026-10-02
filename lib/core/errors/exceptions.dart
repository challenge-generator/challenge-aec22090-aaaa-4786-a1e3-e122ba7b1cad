/// Clase base para todas las excepciones personalizadas de la aplicación.
abstract class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const AppException(this.message, [this.stackTrace]);

  @override
  String toString() => 'AppException: $message';
}

/// Excepción para errores de conexión de red
class NetworkException extends AppException {
  const NetworkException([String message = 'Network connection failed'])
      : super(message);
}

/// Excepción para timeouts en conexiones
class TimeoutException extends AppException {
  const TimeoutException([String message = 'Connection timeout'])
      : super(message);
}

/// Excepción para errores del servidor
class ServerException extends AppException {
  final Map<String, dynamic>? errorData;
  final int? statusCode;

  const ServerException({
    String message = 'Server error',
    this.errorData,
    this.statusCode,
  }) : super(message);

  @override
  String toString() =>
      'ServerException: $message, statusCode: $statusCode, errorData: $errorData';
}

/// Excepción para datos inválidos
class InvalidDataException extends AppException {
  final dynamic invalidValue;

  const InvalidDataException(
      {String message = 'Invalid data', this.invalidValue})
      : super(message);

  @override
  String toString() => 'InvalidDataException: $message, invalidValue: $invalidValue';
}

/// Excepción para errores de autenticación
class AuthenticationException extends AppException {
  const AuthenticationException([String message = 'Authentication failed'])
      : super(message);
}

/// Excepción para operaciones no permitidas
class PermissionException extends AppException {
  const PermissionException([String message = 'Permission denied'])
      : super(message);
}

/// Excepción para errores de caché
class CacheException extends AppException {
  const CacheException([String message = 'Cache operation failed'])
      : super(message);
}

/// Excepción para errores en transacciones
class TransactionException extends AppException {
  const TransactionException([String message = 'Transaction failed'])
      : super(message);
}

/// Excepción para errores de validación
class ValidationException extends AppException {
  final List<String> errors;

  const ValidationException({String message = 'Validation failed', this.errors = const []})
      : super(message);

  @override
  String toString() => 'ValidationException: $message, errors: $errors';
}

/// Excepción para cuando se excede un límite
class LimitExceededException extends AppException {
  const LimitExceededException([String message = 'Limit exceeded'])
      : super(message);
}

/// Maneja errores de la librería http y los convierte a excepciones de la aplicación
Exception handleHttpError(dynamic error) {
  if (error is Exception) {
    if (error.toString().contains('SocketException') ||
        error.toString().contains('Failed host lookup')) {
      return NetworkException();
    } else if (error.toString().contains('TimeoutException')) {
      return TimeoutException();
    } else if (error is FormatException) {
      return InvalidDataException(message: 'Invalid response format');
    }
  }
  return error;
}

/// Convierte respuestas HTTP fallidas a excepciones apropiadas
Never throwHttpException(int statusCode, dynamic responseBody) {
  String message;
  Map<String, dynamic>? errorData;

  try {
    if (responseBody is String) {
      errorData = {'raw': responseBody};
      message = responseBody;
    } else if (responseBody is Map) {
      errorData = responseBody as Map<String, dynamic>;
      message = errorData['message'] ?? 'Server error';
    } else {
      message = 'Server error';
      errorData = {'raw': responseBody.toString()};
    }
  } catch (_) {
    message = 'Server error';
    errorData = {'raw': responseBody.toString()};
  }

  switch (statusCode) {
    case 400:
      throw InvalidDataException(message: message, invalidValue: errorData);
    case 401:
    case 403:
      throw AuthenticationException(message);
    case 404:
      throw InvalidDataException(message: 'Resource not found');
    case 408:
      throw TimeoutException(message);
    case 429:
      throw LimitExceededException(message);
    case >= 500 && < 600:
      throw ServerException(
        message: message,
        errorData: errorData,
        statusCode: statusCode,
      );
    default:
      throw ServerException(
        message: message,
        errorData: errorData,
        statusCode: statusCode,
      );
  }
}
part of flutter_ecommerce_app;

/// Constantes globales de configuración para la aplicación de comercio electrónico.
/// Incluye endpoints, límites de negocio y configuraciones de red.
class AppConstants {
  // Prevent instantiation
  AppConstants._();

  /// Base URL para el API de productos
  static const String baseUrl = 'https://api.ecommerce.example.com/v1';

  /// Endpoints
  static const String productsEndpoint = '/products';
  static const String transactionsEndpoint = '/transactions';
  static const String cartEndpoint = '/cart';

  /// Límites de negocio
  static const int maxItemsPerCart = 20;
  static const double minTransactionAmount = 1.0;
  static const int cacheTTLSeconds = 300; // 5 minutos

  /// Configuración de red
  static const int connectTimeout = 10000; // 10 segundos
  static const int receiveTimeout = 15000; // 15 segundos
  static const int sendTimeout = 10000; // 10 segundos
  static const String contentTypeJson = 'application/json';
  static const String authorizationHeader = 'Authorization';

  /// Configuración de paginación
  static const int defaultPageSize = 10;
  static const int maxPageSize = 50;

  /// Mensajes de usuario
  static const String networkErrorMessage = 'No hay conexión a internet. Por favor verifica tu conexión.';
  static const String serverErrorMessage = 'Error en el servidor. Por favor intenta más tarde.';
  static const String invalidDataMessage = 'Datos inválidos recibidos del servidor.';
  static const String transactionSuccessMessage = 'Transacción completada con éxito';
  static const String cartLimitReachedMessage = 'Has alcanzado el límite máximo de items en el carrito.';
  static const String transactionMinAmountMessage = 'El monto mínimo para transacción es $${minTransactionAmount.toStringAsFixed(2)}';

  /// Configuración de logging
  static const bool enableNetworkLogging = true;
  static const String logTag = 'ECommerceApp';

  /// Configuración de persistencia local
  static const String dbName = 'ecommerce_app.db';
  static const int dbVersion = 1;

  /// Configuración de autenticación
  static const String authTokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userIdKey = 'user_id';

  /// Configuración de animaciones
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration debounceDuration = Duration(milliseconds: 500);

  /// Configuración de localización
  static const String defaultLocale = 'es_ES';
  static const List<String> supportedLocales = ['es_ES', 'en_US'];

  /// Configuración de notificaciones
  static const String notificationChannelId = 'ecommerce_channel';
  static const String notificationChannelName = 'ECommerce Notifications';
  static const String notificationChannelDescription = 'Notificaciones importantes de la app de comercio';

  /// Configuración de imágenes
  static const String placeholderImage = 'assets/images/placeholder.png';
  static const String errorImage = 'assets/images/error.png';
  static const double imageAspectRatio = 1.0;
  static const int imageQuality = 85;

  /// Configuración de validaciones
  static const String emailRegex = r'^[w-.]+@([w-]+.)+[w-]{2,4}$';
  static const String passwordRegex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*d)(?=.*[@$!%*?&])[A-Za-zd@$!%*?&]{8,}$';
}
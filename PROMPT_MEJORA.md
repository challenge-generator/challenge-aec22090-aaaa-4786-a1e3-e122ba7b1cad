# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `test/unit/product_repository_test.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/unit/transaction_bloc_test.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/unit/get_products_usecase_test.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/integration/transaction_flow_test.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/e2e/app_navigation_test.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/bdd/features/products.feature` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/bdd/features/cart.feature` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/bdd/features/transaction.feature` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/bdd/step_definitions/product_steps.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/bdd/step_definitions/cart_steps.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/bdd/step_definitions/transaction_steps.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/bdd/test_helpers.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/fixtures/products.json` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- `test/fixtures/transaction.json` — El topic pide TDD/pruebas: este archivo es el ejercicio.

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Referencias colgando en el codigo que si esta

Cada una rompe la compilacion:

- `lib/data/models/transaction_model.dart` — `TransactionStatusModel.toLowerCase`: Se invoca `toLowerCase` sobre `TransactionStatusModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `lib/data/models/transaction_model.dart` — `PaymentMethodModel.toLowerCase`: Se invoca `toLowerCase` sobre `PaymentMethodModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `lib/data/repositories/product_repository_impl.dart` — `ProductRemoteDataSource.fetchProducts`: Se invoca `fetchProducts` sobre `ProductRemoteDataSource`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `lib/data/repositories/product_repository_impl.dart` — `ProductRemoteDataSource.fetchProductById`: Se invoca `fetchProductById` sobre `ProductRemoteDataSource`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `lib/data/repositories/transaction_repository_impl.dart` — `TransactionRemoteDataSource.fetchTransactions`: Se invoca `fetchTransactions` sobre `TransactionRemoteDataSource`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `lib/data/repositories/transaction_repository_impl.dart` — `TransactionRemoteDataSource.fetchTransactionById`: Se invoca `fetchTransactionById` sobre `TransactionRemoteDataSource`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `test/unit/product_repository_test.dart` — `MockProductRepository.getProducts`: Se invoca `getProducts` sobre `MockProductRepository`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `test/unit/product_repository_test.dart` — `MockProductRepository.getProductById`: Se invoca `getProductById` sobre `MockProductRepository`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `test/unit/product_repository_test.dart` — `MockProductRepository.searchProducts`: Se invoca `searchProducts` sobre `MockProductRepository`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `test/unit/transaction_bloc_test.dart` — `TransactionBloc.close`: Se invoca `close` sobre `TransactionBloc`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `test/unit/transaction_bloc_test.dart` — `TransactionBloc.add`: Se invoca `add` sobre `TransactionBloc`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- `test/unit/get_products_usecase_test.dart` — `MockProductRepository.getProducts`: Se invoca `getProducts` sobre `MockProductRepository`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.

## Como saber que terminaste

```bash
flutter pub get && flutter analyze
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Master

### Brecha de conocimiento
Realiza código aplicando BDD, enseña como hacer UT sencillo y UT de funcionalidades asincronas, diagnostica bugs con el perfilador (profiler) de apps, ha configurado servicios que corren pruebas funcionales Automatizadas en Diferentes Dispositivos

### Misión / candidato
Candidato con experiencia en desarrollo móvil avanzado, trabaja en contexto profesional

### Reto
- Tema: técnicas de pruebas funcionales automatizadas y perfilamiento de aplicaciones
- Seniority: master-l1
- Tipo: practical
- Título: Implementación y diagnóstico de pruebas funcionales automatizadas en aplicaciones móviles
- Tiempo estimado: 20 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración del entorno de pruebas — objetivo: Configurar un entorno que permita ejecutar pruebas funcionales automatizadas en diferentes dispositivos. — entregable (NO resolver): Entorno de pruebas configurado y funcional.
- Fase 2: Implementación de pruebas funcionales utilizando BDD — objetivo: Implementar pruebas funcionales automatizadas utilizando la metodología BDD. — entregable (NO resolver): Conjunto de pruebas funcionales automatizadas utilizando BDD.
- Fase 3: Diagnóstico de bugs utilizando el perfilador de aplicaciones — objetivo: Utilizar técnicas de perfilamiento para diagnosticar y corregir bugs en la aplicación. — entregable (NO resolver): Informe de diagnóstico con recomendaciones para corregir bugs.
- Fase 4: Refactorización y optimización del código — objetivo: Refactorizar y optimizar el código basado en los hallazgos del perfilador. — entregable (NO resolver): Código refactorizado y optimizado con pruebas funcionales actualizadas.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: pubspec.yaml ===
name: flutter_ecommerce_app
description: Aplicación de comercio electrónico con arquitectura limpia y pruebas BDD.

version: 1.0.0+1

environment:
  sdk: ">=3.6.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.6
  equatable: ^2.0.5
  get_it: ^8.0.2
  dartz: ^0.10.1
  http: ^1.2.2
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
    sdk: flutter
  bloc_test: ^9.1.7
  mocktail: ^1.0.4
  gherkin: ^latest
  flutter_lints: ^4.0.0

flutter:
  uses-material-design: true
  assets:
    - test/fixtures/products.json
    - test/fixtures/transaction.json

  # Configuración para pruebas BDD
  gherkin:
    features:
      - test/bdd/features/
    stepDefinitions:
      - test/bdd/step_definitions/
    testHelpers:
      - test/bdd/test_helpers.dart

// === ARCHIVO: lib/main.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_ecommerce_app/presentation/blocs/product_bloc.dart';
import 'package:flutter_ecommerce_app/presentation/blocs/cart_bloc.dart';
import 'package:flutter_ecommerce_app/presentation/blocs/transaction_bloc.dart';
import 'package:flutter_ecommerce_app/presentation/screens/product_list_screen.dart';
import 'package:flutter_ecommerce_app/domain/usecases/get_products.dart';
import 'package:flutter_ecommerce_app/domain/usecases/add_to_cart.dart';
import 'package:flutter_ecommerce_app/domain/usecases/process_transaction.dart';
import 'package:flutter_ecommerce_app/data/repositories/product_repository_impl.dart';
import 'package:flutter_ecommerce_app/data/repositories/transaction_repository_impl.dart';
import 'package:flutter_ecommerce_app/data/datasources/product_remote_datasource.dart';
import 'package:flutter_ecommerce_app/data/datasources/transaction_remote_datasource.dart';

final getIt = GetIt.instance;

void main() {
  setupDependencies();
  runApp(const MyApp());
}

void setupDependencies() {
  // Data sources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<TransactionRemoteDataSource>(
    () => TransactionRemoteDataSourceImpl(),
  );

  // Repositories
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt<ProductRemoteDataSource>()),
  );
  getIt.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(getIt<TransactionRemoteDataSource>()),
  );

  // Use cases
  getIt.registerLazySingleton<GetProducts>(
    () => GetProducts(getIt<ProductRepository>()),
  );
  getIt.registerLazySingleton<AddToCart>(
    () => AddToCart(getIt<ProductRepository>()),
  );
  getIt.registerLazySingleton<ProcessTransaction>(
    () => ProcessTransaction(getIt<TransactionRepository>()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(getIt<GetProducts>())..add(FetchProducts()),
        ),
        BlocProvider(
          create: (context) => CartBloc(getIt<AddToCart>()),
        ),
        BlocProvider(
          create: (context) => TransactionBloc(getIt<ProcessTransaction>()),
        ),
      ],
      child: MaterialApp(
        title: 'E-commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const ProductListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// === ARCHIVO: lib/core/constants/app_constants.dart ===
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

// === ARCHIVO: lib/core/errors/failures.dart ===
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

// === ARCHIVO: lib/core/errors/exceptions.dart ===
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

// === ARCHIVO: lib/domain/entities/product.dart ===
library flutter_ecommerce_app.domain.entities.product;

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;
  final String sku;
  final bool isAvailable;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.stock,
    required this.sku,
    required this.isAvailable,
    required this.createdAt,
    required this.updatedAt,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    int? stock,
    String? sku,
    bool? isAvailable,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      stock: stock ?? this.stock,
      sku: sku ?? this.sku,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        category,
        stock,
        sku,
        isAvailable,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, category: $category, stock: $stock, isAvailable: $isAvailable)';
  }

  bool get hasStock => stock > 0;
  bool get isLowStock => stock > 0 && stock <= 5;
  bool get isOutOfStock => stock <= 0;

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';

  void validate() {
    if (id.isEmpty) {
      throw ArgumentError('Product id cannot be empty');
    }
    if (name.isEmpty) {
      throw ArgumentError('Product name cannot be empty');
    }
    if (price < 0) {
      throw ArgumentError('Product price cannot be negative');
    }
    if (stock < 0) {
      throw ArgumentError('Product stock cannot be negative');
    }
    if (sku.isEmpty) {
      throw ArgumentError('Product SKU cannot be empty');
    }
  }
}

// === ARCHIVO: lib/domain/entities/cart.dart ===
library flutter_ecommerce_app.domain.entities.cart;

import 'package:equatable/equatable.dart';
import 'product.dart';

class CartItem extends Equatable {
  final String id;
  final Product product;
  final int quantity;
  final DateTime addedAt;

  const CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.addedAt,
  });

  CartItem copyWith({
    String? id,
    Product? product,
    int? quantity,
    DateTime? addedAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  double get totalPrice => product.price * quantity;

  @override
  List<Object?> get props => [id, product, quantity, addedAt];

  @override
  String toString() {
    return 'CartItem(id: $id, product: ${product.name}, quantity: $quantity, totalPrice: $totalPrice)';
  }

  void validateQuantity() {
    if (quantity <= 0) {
      throw ArgumentError('Cart item quantity must be greater than zero');
    }
    if (quantity > product.stock) {
      throw ArgumentError('Cannot add more items than available in stock');
    }
  }
}

class Cart extends Equatable {
  final String id;
  final List<CartItem> items;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Cart({
    required this.id,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cart.create({required String id}) {
    final now = DateTime.now();
    return Cart(
      id: id,
      items: const [],
      createdAt: now,
      updatedAt: now,
    );
  }

  Cart copyWith({
    String? id,
    List<CartItem>? items,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Cart(
      id: id ?? this.id,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  Cart addItem(Product product, int quantity, String itemId) {
    final existingIndex = items.indexWhere((item) => item.product.id == product.id);
    
    if (existingIndex >= 0) {
      final existingItem = items[existingIndex];
      final newQuantity = existingItem.quantity + quantity;
      
      if (newQuantity > product.stock) {
        throw ArgumentError('Cannot exceed available stock for product: ${product.name}');
      }
      
      final updatedItem = existingItem.copyWith(quantity: newQuantity);
      final updatedItems = List<CartItem>.from(items);
      updatedItems[existingIndex] = updatedItem;
      
      return copyWith(items: updatedItems);
    }
    
    final newItem = CartItem(
      id: itemId,
      product: product,
      quantity: quantity,
      addedAt: DateTime.now(),
    );
    
    return copyWith(items: [...items, newItem]);
  }

  Cart removeItem(String productId) {
    final updatedItems = items.where((item) => item.product.id != productId).toList();
    return copyWith(items: updatedItems);
  }

  Cart updateQuantity(String productId, int newQuantity) {
    if (newQuantity <= 0) {
      return removeItem(productId);
    }
    
    final index = items.indexWhere((item) => item.product.id == productId);
    if (index < 0) {
      throw ArgumentError('Product not found in cart: $productId');
    }
    
    final item = items[index];
    if (newQuantity > item.product.stock) {
      throw ArgumentError('Cannot exceed available stock for product: ${item.product.name}');
    }
    
    final updatedItem = item.copyWith(quantity: newQuantity);
    final updatedItems = List<CartItem>.from(items);
    updatedItems[index] = updatedItem;
    
    return copyWith(items: updatedItems);
  }

  Cart clear() {
    return copyWith(items: []);
  }

  double get totalAmount {
    if (items.isEmpty) return 0.0;
    return items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  int get itemCount {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  int get uniqueItemCount => items.length;

  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;

  bool containsProduct(String productId) {
    return items.any((item) => item.product.id == productId);
  }

  CartItem? getItem(String productId) {
    try {
      return items.firstWhere((item) => item.product.id == productId);
    } catch (_) {
      return null;
    }
  }

  @override
  List<Object?> get props => [id, items, createdAt, updatedAt];

  @override
  String toString() {
    return 'Cart(id: $id, itemCount: $itemCount, totalAmount: ${totalAmount.toStringAsFixed(2)})';
  }

  String get formattedTotal => '\$${totalAmount.toStringAsFixed(2)}';
}

// === ARCHIVO: lib/domain/entities/transaction.dart ===
library flutter_ecommerce_app.domain.entities.transaction;

import 'package:equatable/equatable.dart';
import 'cart.dart';

enum TransactionStatus {
  pending,
  processing,
  completed,
  failed,
  cancelled,
  refunded;

  bool get isPending => this == TransactionStatus.pending;
  bool get isProcessing => this == TransactionStatus.processing;
  bool get isCompleted => this == TransactionStatus.completed;
  bool get isFailed => this == TransactionStatus.failed;
  bool get isCancelled => this == TransactionStatus.cancelled;
  bool get isRefunded => this == TransactionStatus.refunded;
  bool get isTerminal => isCompleted || isFailed || isCancelled || isRefunded;

  String get displayName {
    switch (this) {
      case TransactionStatus.pending:
        return 'Pending';
      case TransactionStatus.processing:
        return 'Processing';
      case TransactionStatus.completed:
        return 'Completed';
      case TransactionStatus.failed:
        return 'Failed';
      case TransactionStatus.cancelled:
        return 'Cancelled';
      case TransactionStatus.refunded:
        return 'Refunded';
    }
  }
}

enum PaymentMethod {
  creditCard,
  debitCard,
  paypal,
  bankTransfer,
  cash,
  wallet;

  String get displayName {
    switch (this) {
      case PaymentMethod.creditCard:
        return 'Credit Card';
      case PaymentMethod.debitCard:
        return 'Debit Card';
      case PaymentMethod.paypal:
        return 'PayPal';
      case PaymentMethod.bankTransfer:
        return 'Bank Transfer';
      case PaymentMethod.cash:
        return 'Cash';
      case PaymentMethod.wallet:
        return 'Digital Wallet';
    }
  }
}

class TransactionItem extends Equatable {
  final String productId;
  final String productName;
  final double unitPrice;
  final int quantity;
  final double subtotal;

  const TransactionItem({
    required this.productId,
    required this.productName,
    required this.unitPrice,
    required this.quantity,
    required this.subtotal,
  });

  factory TransactionItem.fromCartItem(CartItem cartItem) {
    return TransactionItem(
      productId: cartItem.product.id,
      productName: cartItem.product.name,
      unitPrice: cartItem.product.price,
      quantity: cartItem.quantity,
      subtotal: cartItem.totalPrice,
    );
  }

  @override
  List<Object?> get props => [productId, productName, unitPrice, quantity, subtotal];
}

class Transaction extends Equatable {
  final String id;
  final List<TransactionItem> items;
  final double totalAmount;
  final TransactionStatus status;
  final PaymentMethod paymentMethod;
  final String? customerId;
  final String? customerEmail;
  final String? shippingAddress;
  final String? trackingNumber;
  final String? failureReason;
  final DateTime createdAt;
  final DateTime? completedAt;
  final DateTime? cancelledAt;

  const Transaction({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.paymentMethod,
    this.customerId,
    this.customerEmail,
    this.shippingAddress,
    this.trackingNumber,
    this.failureReason,
    required this.createdAt,
    this.completedAt,
    this.cancelledAt,
  });

  factory Transaction.create({
    required String id,
    required Cart cart,
    required PaymentMethod paymentMethod,
    String? customerId,
    String? customerEmail,
    String? shippingAddress,
  }) {
    final transactionItems = cart.items.map((item) => TransactionItem.fromCartItem(item)).toList();
    
    return Transaction(
      id: id,
      items: transactionItems,
      totalAmount: cart.totalAmount,
      status: TransactionStatus.pending,
      paymentMethod: paymentMethod,
      customerId: customerId,
      customerEmail: customerEmail,
      shippingAddress: shippingAddress,
      createdAt: DateTime.now(),
    );
  }

  Transaction copyWith({
    String? id,
    List<TransactionItem>? items,
    double? totalAmount,
    TransactionStatus? status,
    PaymentMethod? paymentMethod,
    String? customerId,
    String? customerEmail,
    String? shippingAddress,
    String? trackingNumber,
    String? failureReason,
    DateTime? createdAt,
    DateTime? completedAt,
    DateTime? cancelledAt,
  }) {
    return Transaction(
      id: id ?? this.id,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      customerId: customerId ?? this.customerId,
      customerEmail: customerEmail ?? this.customerEmail,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      failureReason: failureReason ?? this.failureReason,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      cancelledAt: cancelledAt ?? this.cancelledAt,
    );
  }

  Transaction markAsProcessing() {
    if (!status.isPending) {
      throw StateError('Can only process pending transactions');
    }
    return copyWith(status: TransactionStatus.processing);
  }

  Transaction markAsCompleted({String? trackingNumber}) {
    if (!status.isProcessing) {
      throw StateError('Can only complete processing transactions');
    }
    return copyWith(
      status: TransactionStatus.completed,
      trackingNumber: trackingNumber,
      completedAt: DateTime.now(),
    );
  }

  Transaction markAsFailed(String reason) {
    if (status.isTerminal) {
      throw StateError('Cannot fail a terminal transaction');
    }
    return copyWith(
      status: TransactionStatus.failed,
      failureReason: reason,
      completedAt: DateTime.now(),
    );
  }

  Transaction cancel({String? reason}) {
    if (status.isTerminal) {
      throw StateError('Cannot cancel a terminal transaction');
    }
    return copyWith(
      status: TransactionStatus.cancelled,
      failureReason: reason,
      cancelledAt: DateTime.now(),
    );
  }

  Transaction refund() {
    if (!status.isCompleted) {
      throw StateError('Can only refund completed transactions');
    }
    return copyWith(status: TransactionStatus.refunded);
  }

  int get itemCount => items.fold(0, (sum, item) => sum + item.quantity);
  
  bool get canBeCancelled => !status.isTerminal;
  bool get canBeRefunded => status.isCompleted;
  bool get canBeProcessed => status.isPending;

  @override
  List<Object?> get props => [
        id,
        items,
        totalAmount,
        status,
        paymentMethod,
        customerId,
        customerEmail,
        shippingAddress,
        trackingNumber,
        failureReason,
        createdAt,
        completedAt,
        cancelledAt,
      ];

  @override
  String toString() {
    return 'Transaction(id: $id, status: ${status.displayName}, totalAmount: ${totalAmount.toStringAsFixed(2)}, itemCount: $itemCount)';
  }

  String get formattedTotal => '\$${totalAmount.toStringAsFixed(2)}';

  void validateForProcessing() {
    if (items.isEmpty) {
      throw ArgumentError('Transaction must have at least one item');
    }
    if (totalAmount <= 0) {
      throw ArgumentError('Transaction total amount must be greater than zero');
    }
    if (customerEmail != null && !_isValidEmail(customerEmail!)) {
      throw ArgumentError('Invalid customer email');
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}

// === ARCHIVO: lib/domain/repositories/product_repository.dart ===
library flutter_ecommerce_app.domain.repositories.product_repository;

import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts({
    int page = 1,
    int pageSize = 20,
  });

  Future<Either<Failure, Product>> getProductById(String id);

  Future<Either<Failure, List<Product>>> searchProducts(String query);

  Future<Either<Failure, List<Product>>> getProductsByCategory(
    String category, {
    int page = 1,
    int pageSize = 20,
  });

  Future<Either<Failure, List<String>>> getCategories();

  Future<Either<Failure, Product>> updateProductStock(
    String productId,
    int quantityChange,
  );

  Future<Either<Failure, List<Product>>> getFeaturedProducts();

  Future<Either<Failure, List<Product>>> getProductsByIds(List<String> ids);

  Future<Either<Failure, bool>> checkProductAvailability(
    String productId,
    int requestedQuantity,
  );
}

// === ARCHIVO: lib/domain/repositories/transaction_repository.dart ===
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/errors/failures.dart';
import '../entities/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, Transaction>> processTransaction({
    required String userId,
    required double amount,
    required String currency,
    required Map<String, dynamic> paymentMethod,
    String? description,
  });

  Future<Either<Failure, Transaction>> getTransactionById(String transactionId);

  Future<Either<Failure, List<Transaction>>> getTransactionsByUserId(
    String userId, {
    int? limit,
    int? offset,
  });

  Future<Either<Failure, Transaction>> refundTransaction(
    String transactionId, {
    required String reason,
  });

  Future<Either<Failure, TransactionStatus>> getTransactionStatus(
    String transactionId,
  );
}

class TransactionParams extends Equatable {
  final String userId;
  final double amount;
  final String currency;
  final Map<String, dynamic> paymentMethod;
  final String? description;
  final DateTime? scheduledAt;
  final Map<String, String>? metadata;

  const TransactionParams({
    required this.userId,
    required this.amount,
    required this.currency,
    required this.paymentMethod,
    this.description,
    this.scheduledAt,
    this.metadata,
  });

  @override
  List<Object?> get props => [
        userId,
        amount,
        currency,
        paymentMethod,
        description,
        scheduledAt,
        metadata,
      ];

  TransactionParams copyWith({
    String? userId,
    double? amount,
    String? currency,
    Map<String, dynamic>? paymentMethod,
    String? description,
    DateTime? scheduledAt,
    Map<String, String>? metadata,
  }) {
    return TransactionParams(
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      description: description ?? this.description,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      metadata: metadata ?? this.metadata,
    );
  }
}

enum TransactionStatus {
  pending,
  processing,
  completed,
  failed,
  refunded,
  cancelled;

  bool get isFinal =>
      this == completed ||
      this == failed ||
      this == refunded ||
      this == cancelled;

  bool get isSuccessful => this == completed;

  String get displayName {
    switch (this) {
      case TransactionStatus.pending:
        return 'Pendiente';
      case TransactionStatus.processing:
        return 'Procesando';
      case TransactionStatus.completed:
        return 'Completada';
      case TransactionStatus.failed:
        return 'Fallida';
      case TransactionStatus.refunded:
        return 'Reembolsada';
      case TransactionStatus.cancelled:
        return 'Cancelada';
    }
  }
}

extension TransactionStatusX on TransactionStatus {
  static TransactionStatus fromString(String value) {
    return TransactionStatus.values.firstWhere(
      (status) => status.name.toLowerCase() == value.toLowerCase(),
      orElse: () => TransactionStatus.pending,
    );
  }
}

// === ARCHIVO: lib/domain/usecases/get_products.dart ===
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/errors/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

abstract class GetProducts {
  Future<Either<Failure, List<Product>>> call({
    GetProductsParams? params,
  });
}

class GetProductsImpl implements GetProducts {
  final ProductRepository repository;

  GetProductsImpl({required this.repository});

  @override
  Future<Either<Failure, List<Product>>> call({
    GetProductsParams? params,
  }) async {
    final effectiveParams = params ?? const GetProductsParams();

    final result = await repository.getProducts(
      page: effectiveParams.page,
      limit: effectiveParams.limit,
      category: effectiveParams.category,
      searchQuery: effectiveParams.searchQuery,
      sortBy: effectiveParams.sortBy,
      ascending: effectiveParams.ascending,
    );

    return result.fold(
      (failure) => Left(failure),
      (products) {
        if (effectiveParams.minPrice != null) {
          final filtered = products
              .where((p) => p.price >= effectiveParams.minPrice!)
              .toList();
          return Right(filtered);
        }
        if (effectiveParams.maxPrice != null) {
          final filtered = products
              .where((p) => p.price <= effectiveParams.maxPrice!)
              .toList();
          return Right(filtered);
        }
        if (effectiveParams.inStockOnly == true) {
          final filtered = products.where((p) => p.stock > 0).toList();
          return Right(filtered);
        }
        return Right(products);
      },
    );
  }
}

class GetProductsParams extends Equatable {
  final int page;
  final int limit;
  final String? category;
  final String? searchQuery;
  final String? sortBy;
  final bool ascending;
  final double? minPrice;
  final double? maxPrice;
  final bool? inStockOnly;

  const GetProductsParams({
    this.page = 1,
    this.limit = 20,
    this.category,
    this.searchQuery,
    this.sortBy,
    this.ascending = true,
    this.minPrice,
    this.maxPrice,
    this.inStockOnly,
  });

  @override
  List<Object?> get props => [
        page,
        limit,
        category,
        searchQuery,
        sortBy,
        ascending,
        minPrice,
        maxPrice,
        inStockOnly,
      ];

  GetProductsParams copyWith({
    int? page,
    int? limit,
    String? category,
    String? searchQuery,
    String? sortBy,
    bool? ascending,
    double? minPrice,
    double? maxPrice,
    bool? inStockOnly,
  }) {
    return GetProductsParams(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      category: category ?? this.category,
      searchQuery: searchQuery ?? this.searchQuery,
      sortBy: sortBy ?? this.sortBy,
      ascending: ascending ?? this.ascending,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      inStockOnly: inStockOnly ?? this.inStockOnly,
    );
  }

  bool get hasFilters =>
      category != null ||
      searchQuery != null ||
      minPrice != null ||
      maxPrice != null ||
      inStockOnly == true;

  Map<String, dynamic> toQueryParams() {
    return {
      'page': page,
      'limit': limit,
      if (category != null) 'category': category,
      if (searchQuery != null) 'q': searchQuery,
      if (sortBy != null) 'sort': sortBy,
      if (!ascending) 'order': 'desc',
      if (minPrice != null) 'min_price': minPrice,
      if (maxPrice != null) 'max_price': maxPrice,
      if (inStockOnly == true) 'in_stock': 'true',
    };
  }
}

// === ARCHIVO: lib/domain/usecases/add_to_cart.dart ===
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

// === ARCHIVO: lib/domain/usecases/process_transaction.dart ===
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../entities/transaction.dart';
import '../repositories/transaction_repository.dart';

abstract class ProcessTransaction {
  Future<Either<Failure, Transaction>> call(ProcessTransactionParams params);
}

class ProcessTransactionImpl implements ProcessTransaction {
  final TransactionRepository repository;
  final int maxRetries;
  final Duration retryDelay;

  ProcessTransactionImpl({
    required this.repository,
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 2),
  });

  @override
  Future<Either<Failure, Transaction>> call(
    ProcessTransactionParams params,
  ) async {
    try {
      params.validate();

      if (params.amount < AppConstants.minTransactionAmount) {
        return Left(InvalidDataFailure(
          '${AppConstants.transactionMinAmountMessage}: mínimo ${AppConstants.minTransactionAmount}',
        ));
      }

      int attempts = 0;
      Either<Failure, Transaction>? lastResult;

      while (attempts < maxRetries) {
        attempts++;

        final result = await repository.processTransaction(
          userId: params.userId,
          amount: params.amount,
          currency: params.currency,
          paymentMethod: params.paymentMethod,
          description: params.description,
        );

        lastResult = result;

        if (result.isRight()) {
          return result;
        }

        final failure = result.fold((l) => l, (r) => r as dynamic);

        if (failure is NetworkFailure || failure is TimeoutFailure) {
          if (attempts < maxRetries) {
            await Future.delayed(retryDelay * attempts);
            continue;
          }
        }

        if (failure is ServerFailure) {
          final statusCode = failure.errorData?['status'] as int?;

          if (statusCode != null && statusCode >= 500) {
            if (attempts < maxRetries) {
              await Future.delayed(retryDelay * attempts);
              continue;
            }
          }
        }

        return result;
      }

      return lastResult ??
          const Left(GenericFailure('Error al procesar transacción'));
    } on ValidationException catch (e) {
      return Left(InvalidDataFailure(e.errors.join(', ')));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, errorData: e.errorData));
    } catch (e) {
      return Left(GenericFailure('Error inesperado: $e'));
    }
  }
}

class ProcessTransactionParams extends Equatable {
  final String userId;
  final double amount;
  final String currency;
  final Map<String, dynamic> paymentMethod;
  final String? description;
  final bool enableRetry;
  final Map<String, String>? metadata;

  const ProcessTransactionParams({
    required this.userId,
    required this.amount,
    this.currency = 'USD',
    required this.paymentMethod,
    this.description,
    this.enableRetry = true,
    this.metadata,
  });

  @override
  List<Object?> get props => [
        userId,
        amount,
        currency,
        paymentMethod,
        description,
        enableRetry,
        metadata,
      ];

  ProcessTransactionParams copyWith({
    String? userId,
    double? amount,
    String? currency,
    Map<String, dynamic>? paymentMethod,
    String? description,
    bool? enableRetry,
    Map<String, String>? metadata,
  }) {
    return ProcessTransactionParams(
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      description: description ?? this.description,
      enableRetry: enableRetry ?? this.enableRetry,
      metadata: metadata ?? this.metadata,
    );
  }

  void validate() {
    final errors = <String>[];

    if (userId.isEmpty) {
      errors.add('El ID de usuario es requerido');
    }

    if (amount <= 0) {
      errors.add('El monto debe ser mayor a cero');
    }

    if (amount < AppConstants.minTransactionAmount) {
      errors.add(
        'El monto mínimo para transacción es ${AppConstants.minTransactionAmount}',
      );
    }

    if (currency.isEmpty) {
      errors.add('La moneda es requerida');
    }

    if (paymentMethod.isEmpty) {
      errors.add('El método de pago es requerido');
    }

    final requiredPaymentKeys = ['type', 'details'];
    for (final key in requiredPaymentKeys) {
      if (!paymentMethod.containsKey(key)) {
        errors.add('El método de pago debe contener: $key');
      }
    }

    if (errors.isNotEmpty) {
      throw ValidationException(
        'Validación de transacción fallida',
        errors,
      );
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'amount': amount,
      'currency': currency,
      'payment_method': paymentMethod,
      if (description != null) 'description': description,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

// === ARCHIVO: lib/data/models/product_model.dart ===
part of flutter_ecommerce_app;

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.stock,
    required super.rating,
    required super.reviewCount,
    super.isAvailable = true,
    super.createdAt,
    super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String? ?? json['imageUrl'] as String? ?? '',
      category: json['category'] as String,
      stock: json['stock'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['review_count'] as int? ?? json['reviewCount'] as int? ?? 0,
      isAvailable: json['is_available'] as bool? ?? json['isAvailable'] as bool? ?? true,
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at'] as String) 
          : (json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : null),
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at'] as String) 
          : (json['updatedAt'] != null ? DateTime.parse(json['updatedAt'] as String) : null),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'category': category,
      'stock': stock,
      'rating': rating,
      'review_count': reviewCount,
      'is_available': isAvailable,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      category: product.category,
      stock: product.stock,
      rating: product.rating,
      reviewCount: product.reviewCount,
      isAvailable: product.isAvailable,
      createdAt: product.createdAt,
      updatedAt: product.updatedAt,
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
      category: category,
      stock: stock,
      rating: rating,
      reviewCount: reviewCount,
      isAvailable: isAvailable,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    int? stock,
    double? rating,
    int? reviewCount,
    bool? isAvailable,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      stock: stock ?? this.stock,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.imageUrl == imageUrl &&
        other.category == category &&
        other.stock == stock &&
        other.rating == rating &&
        other.reviewCount == reviewCount &&
        other.isAvailable == isAvailable;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      name,
      description,
      price,
      imageUrl,
      category,
      stock,
      rating,
      reviewCount,
      isAvailable,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, price: $price, category: $category, stock: $stock)';
  }
}

// === ARCHIVO: lib/data/models/transaction_model.dart ===
part of flutter_ecommerce_app;

enum TransactionStatusModel {
  pending,
  processing,
  completed,
  failed,
  cancelled,
  refunded;

  String get value {
    switch (this) {
      case TransactionStatusModel.pending:
        return 'pending';
      case TransactionStatusModel.processing:
        return 'processing';
      case TransactionStatusModel.completed:
        return 'completed';
      case TransactionStatusModel.failed:
        return 'failed';
      case TransactionStatusModel.cancelled:
        return 'cancelled';
      case TransactionStatusModel.refunded:
        return 'refunded';
    }
  }

  static TransactionStatusModel fromString(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return TransactionStatusModel.pending;
      case 'processing':
        return TransactionStatusModel.processing;
      case 'completed':
        return TransactionStatusModel.completed;
      case 'failed':
        return TransactionStatusModel.failed;
      case 'cancelled':
        return TransactionStatusModel.cancelled;
      case 'refunded':
        return TransactionStatusModel.refunded;
      default:
        return TransactionStatusModel.pending;
    }
  }
}

enum PaymentMethodModel {
  creditCard,
  debitCard,
  paypal,
  bankTransfer,
  cash;

  String get value {
    switch (this) {
      case PaymentMethodModel.creditCard:
        return 'credit_card';
      case PaymentMethodModel.debitCard:
        return 'debit_card';
      case PaymentMethodModel.paypal:
        return 'paypal';
      case PaymentMethodModel.bankTransfer:
        return 'bank_transfer';
      case PaymentMethodModel.cash:
        return 'cash';
    }
  }

  static PaymentMethodModel fromString(String method) {
    switch (method.toLowerCase()) {
      case 'credit_card':
        return PaymentMethodModel.creditCard;
      case 'debit_card':
        return PaymentMethodModel.debitCard;
      case 'paypal':
        return PaymentMethodModel.paypal;
      case 'bank_transfer':
        return PaymentMethodModel.bankTransfer;
      case 'cash':
        return PaymentMethodModel.cash;
      default:
        return PaymentMethodModel.creditCard;
    }
  }
}

class TransactionModel extends Transaction {
  const TransactionModel({
    required super.id,
    required super.userId,
    required super.items,
    required super.totalAmount,
    required super.status,
    required super.paymentMethod,
    required super.createdAt,
    super.completedAt,
    super.errorMessage,
    super.retryCount = 0,
    super.metadata,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    final itemsList = (json['items'] as List<dynamic>?)
            ?.map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
            .toList() ??
        [];

    return TransactionModel(
      id: json['id'] as String,
      userId: json['user_id'] as String? ?? json['userId'] as String? ?? '',
      items: itemsList,
      totalAmount: (json['total_amount'] as num).toDouble() ?? (json['totalAmount'] as num).toDouble(),
      status: TransactionStatusModel.fromString(json['status'] as String? ?? 'pending'),
      paymentMethod: PaymentMethodModel.fromString(json['payment_method'] as String? ?? 'credit_card'),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : (json['createdAt'] != null ? DateTime.parse(json['createdAt'] as String) : DateTime.now()),
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : (json['completedAt'] != null ? DateTime.parse(json['completedAt'] as String) : null),
      errorMessage: json['error_message'] as String? ?? json['errorMessage'] as String?,
      retryCount: json['retry_count'] as int? ?? json['retryCount'] as int? ?? 0,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'items': items.map((item) => CartItemModel.fromEntity(item).toJson()).toList(),
      'total_amount': totalAmount,
      'status': status.value,
      'payment_method': paymentMethod.value,
      'created_at': createdAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'error_message': errorMessage,
      'retry_count': retryCount,
      'metadata': metadata,
    };
  }

  factory TransactionModel.fromEntity(Transaction transaction) {
    return TransactionModel(
      id: transaction.id,
      userId: transaction.userId,
      items: transaction.items,
      totalAmount: transaction.totalAmount,
      status: _mapStatusToModel(transaction.status),
      paymentMethod: _mapPaymentMethodToModel(transaction.paymentMethod),
      createdAt: transaction.createdAt,
      completedAt: transaction.completedAt,
      errorMessage: transaction.errorMessage,
      retryCount: transaction.retryCount,
      metadata: transaction.metadata,
    );
  }

  Transaction toEntity() {
    return Transaction(
      id: id,
      userId: userId,
      items: items,
      totalAmount: totalAmount,
      status: _mapStatusFromModel(status),
      paymentMethod: _mapPaymentMethodFromModel(paymentMethod),
      createdAt: createdAt,
      completedAt: completedAt,
      errorMessage: errorMessage,
      retryCount: retryCount,
      metadata: metadata,
    );
  }

  static TransactionStatus _mapStatusToModel(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.pending:
        return TransactionStatusModel.pending;
      case TransactionStatus.processing:
        return TransactionStatusModel.processing;
      case TransactionStatus.completed:
        return TransactionStatusModel.completed;
      case TransactionStatus.failed:
        return TransactionStatusModel.failed;
      case TransactionStatus.cancelled:
        return TransactionStatusModel.cancelled;
      case TransactionStatus.refunded:
        return TransactionStatusModel.refunded;
    }
  }

  static TransactionStatus _mapStatusFromModel(TransactionStatusModel status) {
    switch (status) {
      case TransactionStatusModel.pending:
        return TransactionStatus.pending;
      case TransactionStatusModel.processing:
        return TransactionStatus.processing;
      case TransactionStatusModel.completed:
        return TransactionStatus.completed;
      case TransactionStatusModel.failed:
        return TransactionStatus.failed;
      case TransactionStatusModel.cancelled:
        return TransactionStatus.cancelled;
      case TransactionStatusModel.refunded:
        return TransactionStatus.refunded;
    }
  }

  static PaymentMethod _mapPaymentMethodToModel(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.creditCard:
        return PaymentMethodModel.creditCard;
      case PaymentMethod.debitCard:
        return PaymentMethodModel.debitCard;
      case PaymentMethod.paypal:
        return PaymentMethodModel.paypal;
      case PaymentMethod.bankTransfer:
        return PaymentMethodModel.bankTransfer;
      case PaymentMethod.cash:
        return PaymentMethodModel.cash;
    }
  }

  static PaymentMethod _mapPaymentMethodFromModel(PaymentMethodModel method) {
    switch (method) {
      case PaymentMethodModel.creditCard:
        return PaymentMethod.creditCard;
      case PaymentMethodModel.debitCard:
        return PaymentMethod.debitCard;
      case PaymentMethodModel.paypal:
        return PaymentMethod.paypal;
      case PaymentMethodModel.bankTransfer:
        return PaymentMethod.bankTransfer;
      case PaymentMethodModel.cash:
        return PaymentMethod.cash;
    }
  }

  TransactionModel copyWith({
    String? id,
    String? userId,
    List<CartItem>? items,
    double? totalAmount,
    TransactionStatusModel? status,
    PaymentMethodModel? paymentMethod,
    DateTime? createdAt,
    DateTime? completedAt,
    String? errorMessage,
    int? retryCount,
    Map<String, dynamic>? metadata,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      errorMessage: errorMessage ?? this.errorMessage,
      retryCount: retryCount ?? this.retryCount,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransactionModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'TransactionModel(id: $id, totalAmount: $totalAmount, status: ${status.value})';
  }
}

class CartItemModel extends CartItem {
  const CartItemModel({
    required super.productId,
    required super.productName,
    required super.quantity,
    required super.unitPrice,
    super.discount = 0.0,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['product_id'] as String? ?? json['productId'] as String? ?? '',
      productName: json['product_name'] as String? ?? json['productName'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 1,
      unitPrice: (json['unit_price'] as num).toDouble() ?? (json['unitPrice'] as num).toDouble(),
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_name': productName,
      'quantity': quantity,
      'unit_price': unitPrice,
      'discount': discount,
    };
  }

  factory CartItemModel.fromEntity(CartItem item) {
    return CartItemModel(
      productId: item.productId,
      productName: item.productName,
      quantity: item.quantity,
      unitPrice: item.unitPrice,
      discount: item.discount,
    );
  }

  double get totalPrice => (unitPrice * quantity) - discount;

  CartItemModel copyWith({
    String? productId,
    String? productName,
    int? quantity,
    double? unitPrice,
    double? discount,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      discount: discount ?? this.discount,
    );
  }
}

// === ARCHIVO: lib/data/datasources/product_remote_datasource.dart ===
part of flutter_ecommerce_app;

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts({int page = 1, int limit = 20});
  Future<ProductModel> getProductById(String id);
  Future<List<ProductModel>> searchProducts(String query, {int page = 1, int limit = 20});
  Future<List<ProductModel>> getProductsByCategory(String category, {int page = 1, int limit = 20});
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  ProductRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<List<ProductModel>> getProducts({int page = 1, int limit = 20}) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.productsEndpoint}').replace(
        queryParameters: {
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );

      final response = await client.get(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleListResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Product fetch timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to fetch products: $e');
    }
  }

  @override
  Future<ProductModel> getProductById(String id) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.productsEndpoint}/$id');

      final response = await client.get(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Product fetch timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to fetch product: $e');
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query, {int page = 1, int limit = 20}) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.productsEndpoint}/search').replace(
        queryParameters: {
          'q': query,
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );

      final response = await client.get(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleListResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Search timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to search products: $e');
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category, {int page = 1, int limit = 20}) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.productsEndpoint}/category/$category').replace(
        queryParameters: {
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );

      final response = await client.get(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleListResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Category fetch timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to fetch category products: $e');
    }
  }

  Map<String, String> _buildHeaders() {
    return {
      'Content-Type': AppConstants.contentTypeJson,
      'Accept': AppConstants.contentTypeJson,
    };
  }

  List<ProductModel> _handleListResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        if (data is List) {
          return data.map((item) => ProductModel.fromJson(item as Map<String, dynamic>)).toList();
        } else if (data is Map<String, dynamic> && data['data'] is List) {
          return (data['data'] as List)
              .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        throw const InvalidDataException('Invalid products response format');
      case 401:
        throw const AuthenticationException('Unauthorized access');
      case 403:
        throw const PermissionException('Access forbidden');
      case 404:
        throw const ServerException('Products not found', statusCode: 404);
      case 500:
      default:
        throw ServerException(
          'Server error: ${response.statusCode}',
          statusCode: response.statusCode,
        );
    }
  }

  ProductModel _handleSingleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        if (data is Map<String, dynamic>) {
          return ProductModel.fromJson(data);
        }
        throw const InvalidDataException('Invalid product response format');
      case 401:
        throw const AuthenticationException('Unauthorized access');
      case 403:
        throw const PermissionException('Access forbidden');
      case 404:
        throw const ServerException('Product not found', statusCode: 404);
      case 500:
      default:
        throw ServerException(
          'Server error: ${response.statusCode}',
          statusCode: response.statusCode,
        );
    }
  }
}

// === ARCHIVO: lib/data/datasources/transaction_remote_datasource.dart ===
part of flutter_ecommerce_app;

abstract class TransactionRemoteDataSource {
  Future<TransactionModel> createTransaction(TransactionModel transaction);
  Future<TransactionModel> getTransactionById(String id);
  Future<List<TransactionModel>> getTransactionsByUserId(String userId, {int page = 1, int limit = 20});
  Future<TransactionModel> updateTransactionStatus(String id, TransactionStatusModel status);
  Future<TransactionModel> cancelTransaction(String id);
  Future<TransactionModel> retryTransaction(String id);
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  TransactionRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<TransactionModel> createTransaction(TransactionModel transaction) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}');

      final response = await client.post(
        uri,
        headers: _buildHeaders(),
        body: json.encode(transaction.toJson()),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transaction creation timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw TransactionException('Failed to create transaction: $e');
    }
  }

  @override
  Future<TransactionModel> getTransactionById(String id) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}/$id');

      final response = await client.get(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transaction fetch timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to fetch transaction: $e');
    }
  }

  @override
  Future<List<TransactionModel>> getTransactionsByUserId(String userId, {int page = 1, int limit = 20}) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}/user/$userId').replace(
        queryParameters: {
          'page': page.toString(),
          'limit': limit.toString(),
        },
      );

      final response = await client.get(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleListResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transactions fetch timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to fetch transactions: $e');
    }
  }

  @override
  Future<TransactionModel> updateTransactionStatus(String id, TransactionStatusModel status) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}/$id/status');

      final response = await client.patch(
        uri,
        headers: _buildHeaders(),
        body: json.encode({'status': status.value}),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transaction status update timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException('Failed to update transaction status: $e');
    }
  }

  @override
  Future<TransactionModel> cancelTransaction(String id) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}/$id/cancel');

      final response = await client.post(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transaction cancellation timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw TransactionException('Failed to cancel transaction: $e');
    }
  }

  @override
  Future<TransactionModel> retryTransaction(String id) async {
    try {
      final uri = Uri.parse('$baseUrl${AppConstants.transactionsEndpoint}/$id/retry');

      final response = await client.post(
        uri,
        headers: _buildHeaders(),
      ).timeout(const Duration(milliseconds: 200));

      return _handleSingleResponse(response);
    } on TimeoutException {
      throw const TimeoutException('Transaction retry timeout');
    } on http.ClientException catch (e) {
      throw NetworkException('Network error: ${e.message}');
    } catch (e) {
      if (e is AppException) rethrow;
      throw TransactionException('Failed to retry transaction: $e');
    }
  }

  Map<String, String> _buildHeaders() {
    return {
      'Content-Type': AppConstants.contentTypeJson,
      'Accept': AppConstants.contentTypeJson,
    };
  }

  List<TransactionModel> _handleListResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        if (data is List) {
          return data.map((item) => TransactionModel.fromJson(item as Map<String, dynamic>)).toList();
        } else if (data is Map<String, dynamic> && data['data'] is List) {
          return (data['data'] as List)
              .map((item) => TransactionModel.fromJson(item as Map<String, dynamic>))
              .toList();
        }
        throw const InvalidDataException('Invalid transactions response format');
      case 401:
        throw const AuthenticationException('Unauthorized access');
      case 403:
        throw const PermissionException('Access forbidden');
      case 404:
        throw const ServerException('Transactions not found', statusCode: 404);
      case 500:
      default:
        throw ServerException(
          'Server error: ${response.statusCode}',
          statusCode: response.statusCode,
        );
    }
  }

  TransactionModel _handleSingleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        final data = json.decode(response.body);
        if (data is Map<String, dynamic>) {
          return TransactionModel.fromJson(data);
        }
        throw const InvalidDataException('Invalid transaction response format');
      case 401:
        throw const AuthenticationException('Unauthorized access');
      case 403:
        throw const PermissionException('Access forbidden');
      case 404:
        throw const ServerException('Transaction not found', statusCode: 404);
      case 409:
        final data = json.decode(response.body);
        throw TransactionException(data['message'] as String? ?? 'Transaction conflict');
      case 422:
        final data = json.decode(response.body);
        throw ValidationException(
          data['message'] as String? ?? 'Validation failed',
          errors: (data['errors'] as List<dynamic>?)?.cast<String>() ?? [],
        );
      case 500:
      default:
        throw ServerException(
          'Server error: ${response.statusCode}',
          statusCode: response.statusCode,
        );
    }
  }
}

// === ARCHIVO: lib/data/repositories/product_repository_impl.dart ===
package flutter_ecommerce_app.data.repositories;

import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/errors/exceptions.dart';
import 'package:flutter_ecommerce_app/core/errors/failures.dart';
import 'package:flutter_ecommerce_app/domain/entities/product.dart';
import 'package:flutter_ecommerce_app/domain/repositories/product_repository.dart';
import 'package:flutter_ecommerce_app/data/datasources/product_remote_datasource.dart';
import 'package:flutter_ecommerce_app/data/models/product_model.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  
  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final productModels = await remoteDataSource.fetchProducts();
      final products = productModels.map((model) => model.toEntity()).toList();
      return Right(products);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on InvalidDataException catch (e) {
      return Left(InvalidDataFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    if (id.isEmpty) {
      return const Left(InvalidDataFailure('Product ID cannot be empty'));
    }
    
    try {
      final productModel = await remoteDataSource.fetchProductById(id);
      return Right(productModel.toEntity());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on InvalidDataException catch (e) {
      return Left(InvalidDataFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> searchProducts(String query) async {
    if (query.isEmpty) {
      return const Left(InvalidDataFailure('Search query cannot be empty'));
    }
    
    try {
      final allProducts = await remoteDataSource.fetchProducts();
      final filteredProducts = allProducts.where((product) {
        final lowercaseQuery = query.toLowerCase();
        return product.name.toLowerCase().contains(lowercaseQuery) ||
               product.description.toLowerCase().contains(lowercaseQuery) ||
               product.category.toLowerCase().contains(lowercaseQuery);
      }).toList();
      
      final products = filteredProducts.map((model) => model.toEntity()).toList();
      return Right(products);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProductsByCategory(String category) async {
    if (category.isEmpty) {
      return const Left(InvalidDataFailure('Category cannot be empty'));
    }
    
    try {
      final allProducts = await remoteDataSource.fetchProducts();
      final filteredProducts = allProducts.where((product) {
        return product.category.toLowerCase() == category.toLowerCase();
      }).toList();
      
      final products = filteredProducts.map((model) => model.toEntity()).toList();
      return Right(products);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }
}

// === ARCHIVO: lib/data/repositories/transaction_repository_impl.dart ===
package flutter_ecommerce_app.data.repositories;

import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/core/errors/exceptions.dart';
import 'package:flutter_ecommerce_app/core/errors/failures.dart';
import 'package:flutter_ecommerce_app/domain/entities/transaction.dart' as domain;
import 'package:flutter_ecommerce_app/domain/repositories/transaction_repository.dart';
import 'package:flutter_ecommerce_app/data/datasources/transaction_remote_datasource.dart';
import 'package:flutter_ecommerce_app/data/models/transaction_model.dart';
import 'package:flutter_ecommerce_app/core/constants/app_constants.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;
  
  TransactionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<domain.Transaction>>> getTransactions() async {
    try {
      final transactionModels = await remoteDataSource.fetchTransactions();
      final transactions = transactionModels.map((model) => model.toEntity()).toList();
      return Right(transactions);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on InvalidDataException catch (e) {
      return Left(InvalidDataFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, domain.Transaction>> getTransactionById(String id) async {
    if (id.isEmpty) {
      return const Left(InvalidDataFailure('Transaction ID cannot be empty'));
    }
    
    try {
      final transactionModel = await remoteDataSource.fetchTransactionById(id);
      return Right(transactionModel.toEntity());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on InvalidDataException catch (e) {
      return Left(InvalidDataFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, domain.Transaction>> createTransaction(domain.Transaction transaction) async {
    if (transaction == null) {
      return const Left(InvalidDataFailure('Transaction cannot be null'));
    }
    
    if (transaction.amount < AppConstants.minTransactionAmount) {
      return Left(TransactionFailure(
        AppConstants.transactionMinAmountMessage,
      ));
    }
    
    try {
      final transactionModel = TransactionModel.fromEntity(transaction);
      final createdModel = await remoteDataSource.createTransaction(transactionModel);
      return Right(createdModel.toEntity());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on TransactionException catch (e) {
      return Left(TransactionFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on InvalidDataException catch (e) {
      return Left(InvalidDataFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, List<domain.Transaction>>> getTransactionsByUserId(String userId) async {
    if (userId.isEmpty) {
      return const Left(InvalidDataFailure('User ID cannot be empty'));
    }
    
    try {
      final allTransactions = await remoteDataSource.fetchTransactions();
      final filteredTransactions = allTransactions.where((transaction) {
        return transaction.userId == userId;
      }).toList();
      
      final transactions = filteredTransactions.map((model) => model.toEntity()).toList();
      return Right(transactions);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }

  @override
  Future<Either<Failure, domain.Transaction>> updateTransactionStatus(
    String transactionId, 
    String newStatus,
  ) async {
    if (transactionId.isEmpty) {
      return const Left(InvalidDataFailure('Transaction ID cannot be empty'));
    }
    
    if (newStatus.isEmpty) {
      return const Left(InvalidDataFailure('Status cannot be empty'));
    }
    
    try {
      final updatedModel = await remoteDataSource.updateTransactionStatus(
        transactionId, 
        newStatus,
      );
      return Right(updatedModel.toEntity());
    } on NetworkException catch (e) {
      return Left(NetworkFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        e.message,
        code: e.statusCode,
        errorData: e.errorData,
        stackTrace: e.stackTrace,
      ));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } on TransactionException catch (e) {
      return Left(TransactionFailure(
        e.message,
        stackTrace: e.stackTrace,
      ));
    } catch (e) {
      return Left(GenericFailure(
        e.toString(),
        stackTrace: StackTrace.current,
      ));
    }
  }
}

// === ARCHIVO: android/app/src/main/AndroidManifest.xml ===
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.VIBRATE" />
    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
    
    <application
        android:label="flutter_ecommerce_app"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:allowBackup="false"
        android:fullBackupContent="false"
        android:hardwareAccelerated="true"
        android:largeHeap="true"
        android:usesCleartextTraffic="true"
        android:networkSecurityConfig="@xml/network_security_config">
        
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
            <intent-filter>
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data android:scheme="https" />
            </intent-filter>
        </activity>
        
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
            
        <meta-data
            android:name="com.google.firebase.messaging.default_notification_channel_id"
            android:value="${notificationChannelId}" />
        
        <service
            android:name="com.google.firebase.messaging.FirebaseMessagingService"
            android:exported="false">
            <intent-filter>
                <action android:name="com.google.firebase.MESSAGING_EVENT" />
            </intent-filter>
        </service>
        
        <receiver
            android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver"
            android:exported="false" />
        
        <receiver
            android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver"
            android:exported="false">
            <intent-filter>
                <action android:name="android.intent.action.BOOT_COMPLETED"/>
                <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
                <action android:name="android.intent.action.QUICKBOOT_POWERON" />
                <action android:name="com.htc.intent.action.QUICKBOOT_POWERON"/>
            </intent-filter>
        </receiver>
        
    </application>
    
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="https" />
        </intent>
        <intent>
            <action android:name="android.intent.action.SEND" />
            <data android:mimeType="*/*" />
        </intent>
    </queries>
    
</manifest>

// === ARCHIVO: lib/presentation/blocs/product_bloc.dart ===
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/get_products.dart';
import '../../../core/errors/failures.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  final String _searchQuery = '';
  final List<Product> _allProducts = [];

  ProductBloc({required this.getProducts}) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<RefreshProducts>(_onRefreshProducts);
    on<FilterProducts>(_onFilterProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final Either<Failure, List<Product>> result = await getProducts(
        GetProductsParams(
          page: event.page ?? 1,
          pageSize: event.pageSize ?? 20,
          categoryId: event.categoryId,
        ),
      );
      result.fold(
        (Failure failure) => emit(ProductError(
          message: failure.message,
          code: failure.code,
        )),
        (List<Product> products) {
          _allProducts.clear();
          _allProducts.addAll(products);
          emit(ProductLoaded(
            products: products,
            hasReachedMax: products.length < (event.pageSize ?? 20),
            currentPage: event.page ?? 1,
          ));
        },
      );
    } catch (e) {
      emit(ProductError(
        message: 'Error al cargar productos: ${e.toString()}',
        code: 500,
      ));
    }
  }

  Future<void> _onRefreshProducts(
    RefreshProducts event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final Either<Failure, List<Product>> result = await getProducts(
        GetProductsParams(page: 1, pageSize: 20),
      );
      result.fold(
        (Failure failure) => emit(ProductError(
          message: failure.message,
          code: failure.code,
        )),
        (List<Product> products) {
          _allProducts.clear();
          _allProducts.addAll(products);
          emit(ProductLoaded(
            products: products,
            hasReachedMax: false,
            currentPage: 1,
          ));
        },
      );
    } catch (e) {
      emit(ProductError(
        message: 'Error al actualizar productos: ${e.toString()}',
        code: 500,
      ));
    }
  }

  void _onFilterProducts(
    FilterProducts event,
    Emitter<ProductState> emit,
  ) {
    if (_allProducts.isEmpty) return;
    
    List<Product> filtered;
    if (event.categoryId == null) {
      filtered = _allProducts;
    } else {
      filtered = _allProducts
          .where((p) => p.categoryId == event.categoryId)
          .toList();
    }
    
    if (event.minPrice != null) {
      filtered = filtered.where((p) => p.price >= event.minPrice!).toList();
    }
    if (event.maxPrice != null) {
      filtered = filtered.where((p) => p.price <= event.maxPrice!).toList();
    }
    
    emit(ProductLoaded(
      products: filtered,
      hasReachedMax: true,
      currentPage: 1,
      categoryId: event.categoryId,
    ));
  }

  void _onSearchProducts(
    SearchProducts event,
    Emitter<ProductState> emit,
  ) {
    if (_allProducts.isEmpty) return;
    
    final query = event.query.toLowerCase();
    final filtered = _allProducts.where((p) {
      return p.name.toLowerCase().contains(query) ||
          p.description.toLowerCase().contains(query);
    }).toList();
    
    emit(ProductLoaded(
      products: filtered,
      hasReachedMax: true,
      currentPage: 1,
      searchQuery: event.query,
    ));
  }
}

// === ARCHIVO: lib/presentation/blocs/product_event.dart ===
part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent {
  final int? page;
  final int? pageSize;
  final String? categoryId;

  const LoadProducts({
    this.page = 1,
    this.pageSize = 20,
    this.categoryId,
  });

  @override
  List<Object?> get props => [page, pageSize, categoryId];
}

class RefreshProducts extends ProductEvent {
  const RefreshProducts();
}

class FilterProducts extends ProductEvent {
  final String? categoryId;
  final double? minPrice;
  final double? maxPrice;
  final bool? inStock;

  const FilterProducts({
    this.categoryId,
    this.minPrice,
    this.maxPrice,
    this.inStock,
  });

  @override
  List<Object?> get props => [categoryId, minPrice, maxPrice, inStock];
}

class SearchProducts extends ProductEvent {
  final String query;

  const SearchProducts(this.query);

  @override
  List<Object?> get props => [query];
}

class LoadMoreProducts extends ProductEvent {
  const LoadMoreProducts();
}

// === ARCHIVO: lib/presentation/blocs/product_state.dart ===
part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  final bool hasReachedMax;
  final int currentPage;
  final String? categoryId;
  final String? searchQuery;

  const ProductLoaded({
    required this.products,
    this.hasReachedMax = false,
    this.currentPage = 1,
    this.categoryId,
    this.searchQuery,
  });

  @override
  List<Object?> get props => [
        products,
        hasReachedMax,
        currentPage,
        categoryId,
        searchQuery,
      ];

  ProductLoaded copyWith({
    List<Product>? products,
    bool? hasReachedMax,
    int? currentPage,
    String? categoryId,
    String? searchQuery,
  }) {
    return ProductLoaded(
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentPage: currentPage ?? this.currentPage,
      categoryId: categoryId ?? this.categoryId,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class ProductError extends ProductState {
  final String message;
  final int? code;

  const ProductError({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];
}

// === ARCHIVO: lib/presentation/blocs/cart_bloc.dart ===
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

// === ARCHIVO: lib/presentation/blocs/cart_event.dart ===
part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddProductToCart extends CartEvent {
  final Product product;

  const AddProductToCart(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveProductFromCart extends CartEvent {
  final String productId;

  const RemoveProductFromCart(this.productId);

  @override
  List<Object?> get props => [productId];
}

class UpdateCartItemQuantity extends CartEvent {
  final String productId;
  final int quantity;

  const UpdateCartItemQuantity({
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [productId, quantity];
}

class ClearCart extends CartEvent {}

class LoadCart extends CartEvent {}

class ApplyCoupon extends CartEvent {
  final String couponCode;

  const ApplyCoupon(this.couponCode);

  @override
  List<Object?> get props => [couponCode];
}

// === ARCHIVO: lib/presentation/blocs/cart_state.dart ===
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

// === ARCHIVO: lib/presentation/blocs/transaction_bloc.dart ===
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../domain/entities/transaction.dart';
import '../../../domain/entities/cart.dart';
import '../../../domain/usecases/process_transaction.dart';
import '../../../core/errors/failures.dart';
import '../../../core/constants/app_constants.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final ProcessTransaction processTransaction;
  final List<Transaction> _transactionHistory = [];

  TransactionBloc({required this.processTransaction})
      : super(TransactionInitial()) {
    on<ProcessPayment>(_onProcessPayment);
    on<LoadTransactionHistory>(_onLoadTransactionHistory);
    on<CancelTransaction>(_onCancelTransaction);
    on<RefundTransaction>(_onRefundTransaction);
  }

  Future<void> _onProcessPayment(
    ProcessPayment event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionProcessing());
    
    try {
      if (event.cart.total < AppConstants.minTransactionAmount) {
        emit(TransactionError(
          message: AppConstants.transactionMinAmountMessage,
          code: 400,
        ));
        return;
      }
      
      final Either<Failure, Transaction> result = await processTransaction(
        ProcessTransactionParams(
          cart: event.cart,
          paymentMethod: event.paymentMethod,
          shippingAddress: event.shippingAddress,
        ),
      );
      
      result.fold(
        (Failure failure) => emit(TransactionError(
          message: failure.message,
          code: failure.code,
        )),
        (Transaction transaction) {
          _transactionHistory.insert(0, transaction);
          emit(TransactionSuccess(transaction: transaction));
        },
      );
    } catch (e) {
      emit(TransactionError(
        message: 'Error al procesar transacción: ${e.toString()}',
        code: 500,
      ));
    }
  }

  void _onLoadTransactionHistory(
    LoadTransactionHistory event,
    Emitter<TransactionState> emit,
  ) {
    emit(TransactionHistoryLoaded(
      transactions: List.from(_transactionHistory),
    ));
  }

  Future<void> _onCancelTransaction(
    CancelTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionProcessing());
    
    try {
      final index = _transactionHistory.indexWhere(
        (t) => t.id == event.transactionId,
      );
      
      if (index >= 0) {
        final transaction = _transactionHistory[index];
        if (transaction.status == 'completed') {
          emit(TransactionError(
            message: 'No se puede cancelar una transacción completada',
            code: 400,
          ));
          return;
        }
        
        final cancelled = Transaction(
          id: transaction.id,
          cart: transaction.cart,
          total: transaction.total,
          status: 'cancelled',
          createdAt: transaction.createdAt,
          paymentMethod: transaction.paymentMethod,
        );
        _transactionHistory[index] = cancelled;
        emit(TransactionSuccess(transaction: cancelled));
      } else {
        emit(TransactionError(
          message: 'Transacción no encontrada',
          code: 404,
        ));
      }
    } catch (e) {
      emit(TransactionError(
        message: 'Error al cancelar transacción: ${e.toString()}',
        code: 500,
      ));
    }
  }

  Future<void> _onRefundTransaction(
    RefundTransaction event,
    Emitter<TransactionState> emit,
  ) async {
    emit(TransactionProcessing());
    
    try {
      final index = _transactionHistory.indexWhere(
        (t) => t.id == event.transactionId,
      );
      
      if (index >= 0) {
        final transaction = _transactionHistory[index];
        if (transaction.status != 'completed') {
          emit(TransactionError(
            message: 'Solo se pueden reembolsar transacciones completadas',
            code: 400,
          ));
          return;
        }
        
        final refunded = Transaction(
          id: transaction.id,
          cart: transaction.cart,
          total: transaction.total,
          status: 'refunded',
          createdAt: transaction.createdAt,
          paymentMethod: transaction.paymentMethod,
        );
        _transactionHistory[index] = refunded;
        emit(TransactionSuccess(transaction: refunded));
      } else {
        emit(TransactionError(
          message: 'Transacción no encontrada',
          code: 404,
        ));
      }
    } catch (e) {
      emit(TransactionError(
        message: 'Error al reembolsar transacción: ${e.toString()}',
        code: 500,
      ));
    }
  }
}

// === ARCHIVO: lib/presentation/blocs/transaction_event.dart ===
part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object?> get props => [];
}

class ProcessPayment extends TransactionEvent {
  final Cart cart;
  final String paymentMethod;
  final String shippingAddress;

  const ProcessPayment({
    required this.cart,
    required this.paymentMethod,
    required this.shippingAddress,
  });

  @override
  List<Object?> get props => [cart, paymentMethod, shippingAddress];
}

class LoadTransactionHistory extends TransactionEvent {}

class CancelTransaction extends TransactionEvent {
  final String transactionId;

  const CancelTransaction(this.transactionId);

  @override
  List<Object?> get props => [transactionId];
}

class RefundTransaction extends TransactionEvent {
  final String transactionId;

  const RefundTransaction(this.transactionId);

  @override
  List<Object?> get props => [transactionId];
}

// === ARCHIVO: lib/presentation/blocs/transaction_state.dart ===
part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object?> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionProcessing extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final Transaction transaction;

  const TransactionSuccess({required this.transaction});

  @override
  List<Object?> get props => [transaction];
}

class TransactionError extends TransactionState {
  final String message;
  final int? code;

  const TransactionError({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];
}

class TransactionHistoryLoaded extends TransactionState {
  final List<Transaction> transactions;

  const TransactionHistoryLoaded({required this.transactions});

  @override
  List<Object?> get props => [transactions];
}

// === ARCHIVO: lib/presentation/screens/product_list_screen.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/product_bloc.dart';
import '../blocs/cart_bloc.dart';
import '../widgets/product_card.dart';
import '../../../domain/entities/product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  bool _isSearchVisible = false;
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<ProductBloc>().add(const LoadProducts());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      final state = context.read<ProductBloc>().state;
      if (state is ProductLoaded && !state.hasReachedMax) {
        context.read<ProductBloc>().add(
              LoadProducts(
                page: state.currentPage + 1,
                categoryId: _selectedCategory,
              ),
            );
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearchVisible
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Buscar productos...',
                  border: InputBorder.none,
                ),
                onSubmitted: (query) {
                  if (query.isNotEmpty) {
                    context.read<ProductBloc>().add(SearchProducts(query));
                  }
                },
              )
            : const Text('Catálogo de Productos'),
        actions: [
          IconButton(
            icon: Icon(_isSearchVisible ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearchVisible = !_isSearchVisible;
                if (!_isSearchVisible) {
                  _searchController.clear();
                  context.read<ProductBloc>().add(const RefreshProducts());
                }
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final itemCount = state is CartLoaded ? state.itemCount : 0;
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () => Navigator.pushNamed(context, '/cart'),
                  ),
                  if (itemCount > 0)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '$itemCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          if (state is ProductError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProductBloc>().add(const LoadProducts());
                    },
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }
          
          if (state is ProductLoaded) {
            if (state.products.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No se encontraron productos',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              );
            }
            
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ProductBloc>().add(const RefreshProducts());
              },
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(8),
                itemCount: state.hasReachedMax
                    ? state.products.length
                    : state.products.length + 1,
                itemBuilder: (context, index) {
                  if (index >= state.products.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  
                  final product = state.products[index];
                  return ProductCard(
                    product: product,
                    onAddToCart: () => _addToCart(context, product),
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/product-detail',
                      arguments: product,
                    ),
                  );
                },
              ),
            );
          }
          
          return const Center(
            child: Text('Cargando productos...'),
          );
        },
      ),
    );
  }

  void _addToCart(BuildContext context, Product product) {
    context.read<CartBloc>().add(AddProductToCart(product));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} añadido al carrito'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Ver carrito',
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filtrar productos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Text('Categoría'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  ChoiceChip(
                    label: const Text('Todos'),
                    selected: _selectedCategory == null,
                    onSelected: (selected) {
                      setState(() => _selectedCategory = null);
                      context.read<ProductBloc>().add(const FilterProducts());
                      Navigator.pop(ctx);
                    },
                  ),
                  ChoiceChip(
                    label: const Text('Electrónica'),
                    selected: _selectedCategory == 'electronics',
                    onSelected: (selected) {
                      setState(() => _selectedCategory = 'electronics');
                      context.read<ProductBloc>().add(
                            const FilterProducts(categoryId: 'electronics'),
                          );
                      Navigator.pop(ctx);
                    },
                  ),
                  ChoiceChip(
                    label: const Text('Ropa'),
                    selected: _selectedCategory == 'clothing',
                    onSelected: (selected) {
                      setState(() => _selectedCategory = 'clothing');
                      context.read<ProductBloc>().add(
                            const FilterProducts(categoryId: 'clothing'),
                          );
                      Navigator.pop(ctx);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Aplicar filtros'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// === ARCHIVO: lib/presentation/screens/cart_screen.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/cart.dart';
import '../blocs/cart_bloc.dart';
import '../widgets/product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CartLoaded) {
            if (state.cart.items.isEmpty) {
              return _buildEmptyCart(context);
            }
            return _buildCartContent(context, state.cart);
          }

          if (state is CartError) {
            return _buildErrorState(context, state.message);
          }

          return const Center(
            child: Text('Carrito vacío'),
          );
        },
      ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 100,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 24),
          Text(
            'Tu carrito está vacío',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'Agrega productos para comenzar',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.store),
            label: const Text('Ver Productos'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartContent(BuildContext context, Cart cart) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];
              return _buildCartItem(context, item, cart);
            },
          ),
        ),
        _buildCartSummary(context, cart),
      ],
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item, Cart cart) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.product.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${item.product.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildQuantityControl(
                        context,
                        item.quantity,
                        () => _decrementQuantity(context, item.product),
                        () => _incrementQuantity(context, item.product, cart),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () => _removeFromCart(
                          context,
                          item.product,
                        ),
                        tooltip: 'Eliminar',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityControl(
    BuildContext context,
    int quantity,
    VoidCallback onDecrement,
    VoidCallback onIncrement,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, size: 18),
            onPressed: quantity > 1 ? onDecrement : null,
            constraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 32,
            ),
            padding: EdgeInsets.zero,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              quantity.toString(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 18),
            onPressed: onIncrement,
            constraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 32,
            ),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  Widget _buildCartSummary(BuildContext context, Cart cart) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '\$${cart.subtotal.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Impuestos',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '\$${cart.tax.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  '\$${cart.total.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/checkout'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Text(
                  'Proceder al Checkout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            'Error al cargar el carrito',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              context.read<CartBloc>().add(LoadCartEvent());
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }

  void _incrementQuantity(BuildContext context, Product product, Cart cart) {
    final currentQuantity = cart.items
        .firstWhere((item) => item.product.id == product.id)
        .quantity;
    if (currentQuantity < 10) {
      context.read<CartBloc>().add(AddToCartEvent(product));
    }
  }

  void _decrementQuantity(BuildContext context, Product product) {
    final cart = context.read<CartBloc>().state;
    if (cart is CartLoaded) {
      final currentItem = cart.cart.items
          .firstWhere((item) => item.product.id == product.id);
      if (currentItem.quantity > 1) {
        context.read<CartBloc>().add(
              UpdateCartItemQuantityEvent(
                product.id,
                currentItem.quantity - 1,
              ),
            );
      } else {
        context.read<CartBloc>().add(RemoveFromCartEvent(product.id));
      }
    }
  }

  void _removeFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Eliminar producto'),
          content: Text(
            '¿Estás seguro de que quieres eliminar ${product.name} del carrito?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<CartBloc>().add(RemoveFromCartEvent(product.id));
                Navigator.of(dialogContext).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}

// === ARCHIVO: lib/presentation/screens/checkout_screen.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/transaction.dart';
import '../blocs/cart_bloc.dart';
import '../blocs/transaction_bloc.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();
  final _nameController = TextEditingController();
  String _selectedPaymentMethod = 'card';
  bool _isProcessing = false;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state is TransactionSuccess) {
          _handleTransactionSuccess(context, state.transaction);
        } else if (state is TransactionFailure) {
          _handleTransactionFailure(context, state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Checkout'),
          centerTitle: true,
          elevation: 2,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            if (cartState is! CartLoaded || cartState.cart.items.isEmpty) {
              return _buildEmptyCartRedirect(context);
            }
            return _buildCheckoutForm(context, cartState.cart);
          },
        ),
      ),
    );
  }

  Widget _buildEmptyCartRedirect(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            'Tu carrito está vacío',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Volver al Carrito'),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutForm(BuildContext context, Cart cart) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOrderSummary(context, cart),
            const SizedBox(height: 24),
            _buildPaymentMethodSelector(context),
            const SizedBox(height: 24),
            if (_selectedPaymentMethod == 'card') _buildCardForm(context),
            if (_selectedPaymentMethod == 'cash') _buildCashInfo(context),
            const SizedBox(height: 24),
            _buildShippingInfo(context),
            const SizedBox(height: 32),
            _buildPlaceOrderButton(context, cart),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context, Cart cart) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.receipt_long),
                const SizedBox(width: 8),
                Text(
                  'Resumen del Pedido',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Divider(height: 24),
            ...cart.items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${item.product.name} x${item.quantity}',
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '\$${(item.product.price * item.quantity).toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )),
            const Divider(),
            _buildSummaryRow(context, 'Subtotal', cart.subtotal),
            _buildSummaryRow(context, 'Impuestos', cart.tax),
            const SizedBox(height: 8),
            _buildSummaryRow(context, 'Total', cart.total, isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    double amount, {
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                : Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: isTotal
                ? Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    )
                : Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Método de Pago',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        _buildPaymentOption(
          context,
          'card',
          'Tarjeta de Crédito/Débito',
          Icons.credit_card,
        ),
        const SizedBox(height: 8),
        _buildPaymentOption(
          context,
          'cash',
          'Pago en Efectivo',
          Icons.money,
        ),
      ],
    );
  }

  Widget _buildPaymentOption(
    BuildContext context,
    String value,
    String label,
    IconData icon,
  ) {
    final isSelected = _selectedPaymentMethod == value;
    return InkWell(
      onTap: () => setState(() => _selectedPaymentMethod = value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[600],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: isSelected ? FontWeight.bold : null,
                    ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: Theme.of(context).colorScheme.primary,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardForm(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Datos de la Tarjeta',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre en la tarjeta',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa el nombre';
                }
                return null;
              },
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Número de tarjeta',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.credit_card),
                hintText: '1234 5678 9012 3456',
              ),
              keyboardType: TextInputType.number,
              maxLength: 16,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa el número de tarjeta';
                }
                if (value.length < 16) {
                  return 'Número de tarjeta inválido';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _expiryController,
                    decoration: const InputDecoration(
                      labelText: 'Vencimiento',
                      border: OutlineInputBorder(),
                      hintText: 'MM/AA',
                    ),
                    keyboardType: TextInputType.datetime,
                    maxLength: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Requerido';
                      }
                      if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
                        return 'Formato: MM/AA';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _cvvController,
                    decoration: const InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                      hintText: '123',
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Requerido';
                      }
                      if (value.length < 3) {
                        return 'CVV inválido';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCashInfo(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.amber[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(
              Icons.info_outline,
              color: Colors.amber,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'El pago en efectivo se realizará al momento de recibir tu pedido.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingInfo(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.local_shipping),
                const SizedBox(width: 8),
                Text(
                  'Dirección de Envío',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Calle Principal 123',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Colonia Centro',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            Text(
              'Ciudad de México, CP 01000',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 12),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit),
              label: const Text('Cambiar dirección'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceOrderButton(BuildContext context, Cart cart) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isProcessing ? null : () => _placeOrder(context, cart),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        child: _isProcessing
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Text(
                'Realizar Pedido',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  void _placeOrder(BuildContext context, Cart cart) {
    if (_selectedPaymentMethod == 'card') {
      if (!_formKey.currentState!.validate()) {
        return;
      }
    }

    setState(() => _isProcessing = true);

    final transaction = Transaction(
      id: '',
      amount: cart.total,
      status: 'pending',
      paymentMethod: _selectedPaymentMethod,
      createdAt: DateTime.now(),
      items: cart.items
          .map((item) => TransactionItem(
                productId: item.product.id,
                productName: item.product.name,
                quantity: item.quantity,
                unitPrice: item.product.price,
              ))
          .toList(),
    );

    context.read<TransactionBloc>().add(ProcessTransactionEvent(transaction));
  }

  void _handleTransactionSuccess(
    BuildContext context,
    Transaction transaction,
  ) {
    setState(() => _isProcessing = false);
    context.read<CartBloc>().add(ClearCartEvent());

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 48,
          ),
          title: const Text('Pedido Confirmado'),
          content: Text(
            'Tu pedido ha sido procesado exitosamente.\n\n'
            'Número de orden: ${transaction.id}\n'
            'Total: \$${transaction.amount.toStringAsFixed(2)}',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _handleTransactionFailure(BuildContext context, String message) {
    setState(() => _isProcessing = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: 'Reintentar',
          textColor: Colors.white,
          onPressed: () {
            final cartState = context.read<CartBloc>().state;
            if (cartState is CartLoaded) {
              _placeOrder(context, cartState.cart);
            }
          },
        ),
      ),
    );
  }
}

// === ARCHIVO: lib/presentation/widgets/product_card.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';
import '../blocs/cart_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(context),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductName(context),
                    const SizedBox(height: 4),
                    _buildProductDescription(context),
                    const Spacer(),
                    _buildPriceAndActions(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                color: Colors.grey[200],
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    strokeWidth: 2,
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[200],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_not_supported,
                      size: 48,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Imagen no disponible',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          if (product.isAvailable)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Disponible',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (!product.isAvailable)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Agotado',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProductName(BuildContext context) {
    return Text(
      product.name,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProductDescription(BuildContext context) {
    return Text(
      product.description,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
          ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildPriceAndActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (product.originalPrice != null &&
                product.originalPrice! > product.price)
              Text(
                '\$${product.originalPrice!.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey[500],
                    ),
              ),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ],
        ),
        _buildAddToCartButton(context),
      ],
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return Material(
      color: product.isAvailable
          ? Theme.of(context).colorScheme.primary
          : Colors.grey[400],
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: product.isAvailable ? () => _addToCart(context) : null,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context) {
    context.read<CartBloc>().add(AddToCartEvent(product));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '${product.name} agregado al carrito',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'VER',
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          },
        ),
      ),
    );
  }
}

// === ARCHIVO: test/unit/product_repository_test.dart ===
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

// === ARCHIVO: test/unit/transaction_bloc_test.dart ===
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/presentation/blocs/transaction_bloc.dart';
import 'package:flutter_ecommerce_app/domain/usecases/process_transaction.dart';
import 'package:flutter_ecommerce_app/domain/entities/transaction.dart';
import 'package:flutter_ecommerce_app/core/errors/failures.dart';

class MockProcessTransaction extends Mock implements ProcessTransaction {}

void main() {
  late MockProcessTransaction mockProcessTransaction;
  late TransactionBloc bloc;

  setUpAll(() {
    registerFallbackValue(const Transaction(
      id: '',
      items: [],
      totalAmount: 0,
      status: 'pending',
      createdAt: null,
    ));
  });

  setUp(() {
    mockProcessTransaction = MockProcessTransaction();
    bloc = TransactionBloc(processTransaction: mockProcessTransaction);
  });

  tearDown(() {
    bloc.close();
  });

  group('TransactionBloc', () {
    const testTransaction = Transaction(
      id: 'tx_123',
      items: [],
      totalAmount: 199.99,
      status: 'pending',
      createdAt: null,
    );

    const successResult = Transaction(
      id: 'tx_123',
      items: [],
      totalAmount: 199.99,
      status: 'completed',
      createdAt: null,
    );

    test.skip('initial state should be TransactionInitial', () {
      expect(bloc.state, isA<TransactionInitial>());
    });

    blocTest<TransactionBloc, TransactionState>(
      'emits [TransactionLoading, TransactionSuccess] when ProcessTransaction succeeds',
      build: () {
        when(() => mockProcessTransaction(any()))
            .thenAnswer((_) async => const Right(successResult));
        return bloc;
      },
      act: (bloc) => bloc.add(const ProcessTransactionRequested(testTransaction)),
      expect: () => [
        isA<TransactionLoading>(),
        isA<TransactionSuccess>(),
      ],
    );

    blocTest<TransactionBloc, TransactionState>(
      'emits [TransactionLoading, TransactionFailure] when ProcessTransaction fails',
      build: () {
        when(() => mockProcessTransaction(any()))
            .thenAnswer((_) async => const Left(TransactionFailure('Transaction failed')));
        return bloc;
      },
      act: (bloc) => bloc.add(const ProcessTransactionRequested(testTransaction)),
      expect: () => [
        isA<TransactionLoading>(),
        isA<TransactionFailure>(),
      ],
    );

    blocTest<TransactionBloc, TransactionState>(
      'emits TransactionFailure when amount is below minimum',
      build: () {
        when(() => mockProcessTransaction(any()))
            .thenAnswer((_) async => const Left(TransactionFailure('Minimum amount not met')));
        return bloc;
      },
      act: (bloc) => bloc.add(const ProcessTransactionRequested(
        Transaction(id: 'tx_1', items: [], totalAmount: 5.0, status: 'pending', createdAt: null),
      )),
      expect: () => [
        isA<TransactionLoading>(),
        isA<TransactionFailure>(),
      ],
    );
  });
}

// === ARCHIVO: test/unit/get_products_usecase_test.dart ===
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

// === ARCHIVO: test/integration/transaction_flow_test.dart ===
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_ecommerce_app/main.dart' as app;
import 'package:flutter_ecommerce_app/domain/entities/product.dart';
import 'package:flutter_ecommerce_app/domain/entities/transaction.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Transaction Flow Integration Tests', () {
    test.skip('complete purchase flow should succeed with valid products', () async {
      await app.main();
      await Future.delayed(const Duration(seconds: 2));
    });

    test.skip('transaction should fail when cart is empty', () async {
      await app.main();
      await Future.delayed(const Duration(seconds: 2));
    });

    test.skip('transaction should fail when amount is below minimum', () async {
      await app.main();
      await Future.delayed(const Duration(seconds: 2));
    });

    test.skip('transaction should succeed after adding valid products to cart', () async {
      await app.main();
      await Future.delayed(const Duration(seconds: 2));
    });

    test.skip('should handle network error during transaction', () async {
      await app.main();
      await Future.delayed(const Duration(seconds: 2));
    });

    test.skip('should display transaction confirmation on success', () async {
      await app.main();
      await Future.delayed(const Duration(seconds: 2));
    });

    test.skip('should retry transaction on timeout', () async {
      await app.main();
      await Future.delayed(const Duration(seconds: 2));
    });

    test.skip('should navigate back to products after successful transaction', () async {
      await app.main();
      await Future.delayed(const Duration(seconds: 2));
    });
  });
}

// === ARCHIVO: test/e2e/app_navigation_test.dart ===
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_ecommerce_app/main.dart' as app;
import 'package:flutter_ecommerce_app/presentation/screens/product_list_screen.dart';
import 'package:flutter_ecommerce_app/presentation/screens/cart_screen.dart';
import 'package:flutter_ecommerce_app/presentation/screens/checkout_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Navegación de la aplicación - Superficie de Práctica', () {
    test('Navegación desde lista de productos hasta checkout', () async {
      app.main();
      await tester.pumpAndSettle();

      // Given: El usuario está en la pantalla de lista de productos
      expect(find.byType(ProductListScreen), findsOneWidget);

      // When: El usuario toca un producto para verlo en detalle
      // Then: Navega a la pantalla de detalle del producto
      // TODO: Implementar navegación a detalle

      // When: El usuario agrega el producto al carrito
      // Then: El producto aparece en el carrito
      // TODO: Implementar agregar al carrito

      // When: El usuario navega al carrito
      final cartIcon = find.byIcon(Icons.shopping_cart);
      if (cartIcon.evaluateToRenderObjectWidget().isNotEmpty) {
        await tester.tap(cartIcon);
        await tester.pumpAndSettle();
      }
      // Then: Está en la pantalla del carrito
      expect(find.byType(CartScreen), findsOneWidget);

      // When: El usuario procede al checkout
      final checkoutButton = find.text('Proceder al pago');
      if (checkoutButton.evaluateToRenderObjectWidget().isNotEmpty) {
        await tester.tap(checkoutButton);
        await tester.pumpAndSettle();
      }
      // Then: Está en la pantalla de checkout
      expect(find.byType(CheckoutScreen), findsOneWidget);
    });

    test('Navegación hacia atrás entre pantallas', () async {
      app.main();
      await tester.pumpAndSettle();

      // Given: El usuario está en checkout
      // When: Toca el botón de volver
      final backButton = find.byType(BackButton);
      if (backButton.evaluateToRenderObjectWidget().isNotEmpty) {
        await tester.tap(backButton);
        await tester.pumpAndSettle();
      }
      // Then: Regresa a la pantalla anterior
      // TODO: Verificar navegación hacia atrás
    });

    test('Navegación condeep linking', () async {
      // Given: La aplicación está configurada para deep linking
      // When: El usuario abre un enlace profundo a un producto específico
      // Then: La aplicación navega directamente a ese producto
      // TODO: Implementar prueba de deep linking
    });

    test('Navegación con parámetros de ruta', () async {
      // Given: La aplicación tiene rutas con parámetros
      // When: El usuario navega a una ruta con parámetros
      // Then: Los parámetros se pasan correctamente a la pantalla destino
      // TODO: Implementar prueba de parámetros de ruta
    });

    test('Navegación en flujo de compra completo', () async {
      app.main();
      await tester.pumpAndSettle();

      // Given: El usuario inicia en la pantalla principal
      expect(find.byType(ProductListScreen), findsOneWidget);

      // When: Navega por el flujo completo de compra
      // - Selecciona producto
      // - Agrega al carrito
      // - Revisa carrito
      // - Procede a checkout
      // - Completa la compra
      // Then: La navegación entre todas las pantallas es fluida
      // TODO: Implementar flujo completo de compra
    });

    test('Navegación con estado preservado', () async {
      // Given: El usuario tiene items en el carrito
      // When: Navega entre pantallas sin completar una acción
      // Then: El estado del carrito se preserva
      // TODO: Implementar prueba de preservación de estado
    });

    test('Manejo de navegación con errores de red', () async {
      // Given: La aplicación tiene conexión de red
      // When: Pierde conectividad durante la navegación
      // Then: Muestra mensaje de error apropiado
      // TODO: Implementar prueba de manejo de errores de red
    });

    test('Navegación con animaciones', () async {
      // Given: Las transiciones de pantalla tienen animaciones
      // When: El usuario navega rápidamente entre pantallas
      // Then: Las animaciones se completan correctamente
      // TODO: Implementar prueba de animaciones de navegación
    });

    test('Navegación con gestures', () async {
      app.main();
      await tester.pumpAndSettle();

      // Given: El usuario está en la lista de productos
      // When: Hace swipe para navegar entre secciones
      // Then: La navegación por gestures funciona correctamente
      // TODO: Implementar prueba de navegación por gestures
    });

    test('Navegación con bottom navigation bar', () async {
      // Given: La aplicación tiene bottom navigation
      // When: El usuario toca los iconos de navegación inferior
      // Then: Navega a las secciones correspondientes
      // TODO: Implementar prueba de bottom navigation
    });
  });

  group('Casos edge en navegación', () {
    test('Navegación con pantalla no encontrada', () async {
      // Given: El usuario intenta navegar a una ruta inexistente
      // When: La aplicación recibe una ruta no definida
      // Then: Muestra pantalla de error 404 o redirige a home
      // TODO: Implementar manejo de rutas no encontradas
    });

    test('Navegación concurrente', () async {
      // Given: El usuario intenta navegar mientras hay una navegación en progreso
      // When: Toca múltiples botones de navegación rápidamente
      // Then: Las navegaciones se manejan correctamente sin errores
      // TODO: Implementar prueba de navegación concurrente
    });

    test('Navegación con dialogs modales', () async {
      // Given: Hay un dialog modal abierto
      // When: El usuario intenta navegar
      // Then: El dialog se cierra antes de navegar
      // TODO: Implementar prueba de navegación con modales
    });
  });
}

// === ARCHIVO: test/bdd/features/products.feature ===
Feature: Product Management
  As a user of the e-commerce application
  I want to browse and manage products
  So that I can find and purchase items I need

  Background:
    Given the application is running
    And the user is on the product list screen

  Scenario: View list of products
    Given the product catalog is loaded
    When the user navigates to the products section
    Then the system should display all available products
    And each product should show name, price, and image

  Scenario: Search for a product
    Given the product catalog contains multiple items
    When the user enters a search term in the search field
    Then the system should filter products matching the search term
    And display the filtered results

  Scenario: View product details
    Given the user is viewing the product list
    When the user taps on a specific product
    Then the system should navigate to the product detail screen
    And display full product information including description

  Scenario: Filter products by category
    Given the product catalog has items in multiple categories
    When the user selects a category filter
    Then the system should display only products in that category

  Scenario: Sort products by price
    Given the user is viewing the product list
    When the user selects price sorting option
    Then the system should reorder products by price
    And display them in ascending or descending order

  Scenario: Add product to wishlist
    Given the user is viewing a product
    When the user taps the wishlist button
    Then the product should be added to the wishlist
    And the user should see a confirmation

  Scenario: Product out of stock
    Given a product has zero stock
    When the user views that product
    Then the system should display an out of stock message
    And disable the add to cart button

// === ARCHIVO: test/bdd/features/cart.feature ===
Feature: Shopping Cart Management
  As a customer
  I want to manage my shopping cart
  So that I can purchase items I selected

  Background:
    Given the application is running
    And the user has added items to the cart

  Scenario: Add item to cart
    Given the user is viewing a product
    When the user taps the add to cart button
    Then the item should be added to the cart
    And the cart count should increase
    And the user should see a success notification

  Scenario: Remove item from cart
    Given the user has items in the cart
    When the user removes an item
    Then the item should be removed from the cart
    And the cart total should update
    And the cart count should decrease

  Scenario: Update item quantity
    Given the user has items in the cart
    When the user changes the quantity of an item
    Then the cart should update the item quantity
    And recalculate the total price

  Scenario: Cart maximum items limit
    Given the cart has reached the maximum item limit
    When the user tries to add another item
    Then the system should display an error message
    And prevent adding the item

  Scenario: View cart total
    Given the user has items in the cart
    When the user views the cart
    Then the system should display the subtotal for each item
    And display the total amount

  Scenario: Clear cart
    Given the user has items in the cart
    When the user clears the entire cart
    Then all items should be removed
    And the cart should be empty

  Scenario: Proceed to checkout
    Given the user has items in the cart
    When the user taps the checkout button
    Then the system should navigate to checkout screen
    And display order summary

// === ARCHIVO: test/bdd/features/transaction.feature ===
Feature: Transaction Processing
  As a customer
  I want to complete purchase transactions
  So that I can buy products from the application

  Background:
    Given the application is running
    And the user has items in the cart
    And the user is on the checkout screen

  Scenario: Process successful transaction
    Given the user has valid payment information
    And the cart total meets the minimum requirement
    When the user submits the transaction
    Then the system should process the payment
    And display a success confirmation
    And create a transaction record
    And clear the cart

  Scenario: Transaction below minimum amount
    Given the cart total is below the minimum transaction amount
    When the user tries to submit the transaction
    Then the system should display an error message
    And prevent the transaction from processing

  Scenario: Payment method validation
    Given the user has entered invalid payment information
    When the user submits the transaction
    Then the system should validate the payment details
    And display validation errors

  Scenario: Network failure during transaction
    Given the user submits a transaction
    When a network error occurs during processing
    Then the system should display a network error message
    And allow the user to retry the transaction

  Scenario: Transaction timeout
    Given the user submits a transaction
    When the transaction takes longer than expected
    Then the system should display a timeout message
    And allow the user to retry

  Scenario: View transaction history
    Given the user has completed previous transactions
    When the user navigates to transaction history
    Then the system should display all past transactions
    And include transaction date, amount, and status

  Scenario: Transaction with invalid data
    Given the user submits a transaction with missing data
    When the system validates the transaction
    Then the system should reject the transaction
    And display specific validation errors

// === ARCHIVO: test/bdd/step_definitions/product_steps.dart ===
import 'package:gherkin/gherkin.dart';

class ProductSteps {
  Given1<String, TestWorld> theProductCatalogIsLoaded = (String catalogStatus) async {
    // Superficie de práctica: implementar lógica para verificar carga del catálogo
  };

  When1<String, TestWorld> theUserNavigatesToTheProductsSection = (String section) async {
    // Superficie de práctica: implementar navegación a sección de productos
  };

  Then0<TestWorld> theSystemShouldDisplayAllAvailableProducts = () async {
    // Superficie de práctica: verificar que se muestran todos los productos
  };

  Then0<TestWorld> eachProductShouldShowNamePriceAndImage = () async {
    // Superficie de práctica: verificar atributos visibles del producto
  };

  Given1<String, TestWorld> theProductCatalogContainsMultipleItems = (String count) async {
    // Superficie de práctica: verificar que el catálogo tiene productos
  };

  When1<String, TestWorld> theUserEntersASearchTermInTheSearchField = (String term) async {
    // Superficie de práctica: implementar entrada de término de búsqueda
  };

  Then0<TestWorld> theSystemShouldFilterProductsMatchingTheSearchTerm = () async {
    // Superficie de práctica: verificar filtrado de productos
  };

  Then0<TestWorld> displayTheFilteredResults = () async {
    // Superficie de práctica: verificar resultados filtrados
  };

  Given0<TestWorld> theUserIsViewingTheProductList = () async {
    // Superficie de práctica: verificar estado de vista de lista
  };

  When1<String, TestWorld> theUserTapsOnASpecificProduct = (String productId) async {
    // Superficie de práctica: implementar tap en producto
  };

  Then0<TestWorld> theSystemShouldNavigateToTheProductDetailScreen = () async {
    // Superficie de práctica: verificar navegación a detalles
  };

  Then0<TestWorld> displayFullProductInformationIncludingDescription = () async {
    // Superficie de práctica: verificar información completa
  };

  Given1<String, TestWorld> theProductCatalogHasItemsInMultipleCategories = (String categories) async {
    // Superficie de práctica: verificar categorías disponibles
  };

  When1<String, TestWorld> theUserSelectsACategoryFilter = (String category) async {
    // Superficie de práctica: implementar selección de categoría
  };

  Then0<TestWorld> theSystemShouldDisplayOnlyProductsInThatCategory = () async {
    // Superficie de práctica: verificar filtrado por categoría
  };

  When1<String, TestWorld> theUserSelectsPriceSortingOption = (String order) async {
    // Superficie de práctica: implementar ordenamiento por precio
  };

  Then0<TestWorld> theSystemShouldReorderProductsByPrice = () async {
    // Superficie de práctica: verificar reordenamiento
  };

  Then1<String, TestWorld> displayThemInAscendingOrDescendingOrder = (String order) async {
    // Superficie de práctica: verificar orden correcto
  };

  Given1<String, TestWorld> theUserIsViewingAProduct = (String productId) async {
    // Superficie de práctica: verificar estado de vista de producto
  };

  When0<TestWorld> theUserTapsTheWishlistButton = () async {
    // Superficie de práctica: implementar tap en wishlist
  };

  Then0<TestWorld> theProductShouldBeAddedToTheWishlist = () async {
    // Superficie de práctica: verificar adición a wishlist
  };

  Then0<TestWorld> theUserShouldSeeAConfirmation = () async {
    // Superficie de práctica: verificar mensaje de confirmación
  };

  Given1<String, TestWorld> aProductHasZeroStock = (String productId) async {
    // Superficie de práctica: verificar producto sin stock
  };

  When1<String, TestWorld> theUserViewsThatProduct = (String productId) async {
    // Superficie de práctica: implementar vista de producto
  };

  Then0<TestWorld> theSystemShouldDisplayAnOutOfStockMessage = () async {
    // Superficie de práctica: verificar mensaje sin stock
  };

  Then0<TestWorld> disableTheAddToCartButton = () async {
    // Superficie de práctica: verificar botón deshabilitado
  };

// === ARCHIVO: test/bdd/step_definitions/cart_steps.dart ===
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

// === ARCHIVO: test/bdd/step_definitions/transaction_steps.dart ===
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

// === ARCHIVO: test/bdd/test_helpers.dart ===
import 'package:gherkin/gherkin.dart';
import 'package:flutter_ecommerce_app/domain/repositories/product_repository.dart';
import 'package:flutter_ecommerce_app/domain/repositories/transaction_repository.dart';
import 'package:flutter_ecommerce_app/core/errors/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository {}

class MockTransactionRepository extends Mock implements TransactionRepository {}

class AppWorld extends World {
  final Map<String, dynamic> state = {};
  final MockProductRepository productRepository = MockProductRepository();
  final MockTransactionRepository transactionRepository = MockTransactionRepository();

  AppWorld() {
    register<ProductRepository>(productRepository);
    register<TransactionRepository>(transactionRepository);
  }

  T get<T>() {
    if (T == ProductRepository) return productRepository as T;
    if (T == TransactionRepository) return transactionRepository as T;
    throw StateError('Unknown type: $T');
  }

  void register<T>(T instance) {
    state[T.toString()] = instance;
  }

  void setScenarioVariable(String key, dynamic value) {
    state[key] = value;
  }

  dynamic getScenarioVariable(String key) {
    return state[key];
  }

  void clearScenarioVariables() {
    state.removeWhere((key, value) => !key.contains('Repository'));
  }
}

Future<void> setupTestEnvironment() async {
  TestWidgetsFlutterBinding.ensureInitialized();
}

Future<void> tearDownTestEnvironment() async {
  await Future.delayed(const Duration(milliseconds: 100));
}

gherkin.GherkinRunner createTestRunner({
  required List<gherkin.StepDefinitionGeneric> steps,
  List<gherkin.HookDefinition>? hooks,
}) {
  return gherkin.GherkinRunner(
    gherkin.TestConfiguration(
      features: [gherkin.Feature('test/bdd/features/cart.feature')],
      stepDefinitions: steps,
      hooks: hooks ?? [],
      worldFactory: () => AppWorld(),
    ),
  );
}

extension GivenMixin on gherkin.Given {
  static gherkin.Given create(
    Pattern pattern,
    Future<void> Function(gherkin.StepContext) body,
  ) {
    return gherkin.Given(pattern, body);
  }
}

extension WhenMixin on gherkin.When {
  static gherkin.When create(
    Pattern pattern,
    Future<void> Function(gherkin.StepContext) body,
  ) {
    return gherkin.When(pattern, body);
  }
}

extension ThenMixin on gherkin.Then {
  static gherkin.Then create(
    Pattern pattern,
    Future<void> Function(gherkin.StepContext) body,
  ) {
    return gherkin.Then(pattern, body);
  }
}

// === ARCHIVO: test/fixtures/products.json ===
[
  {
    "id": "prod_001",
    "name": "Smartphone Pro X",
    "description": "Teléfono inteligente de última generación con pantalla AMOLED de 6.7 pulgadas",
    "price": 999.99,
    "currency": "USD",
    "category": "electronics",
    "stock": 50,
    "imageUrl": "https://example.com/images/smartphone_pro_x.jpg",
    "sku": "SPX-2024-001",
    "brand": "TechBrand",
    "rating": 4.5,
    "reviewCount": 128,
    "isAvailable": true,
    "tags": ["smartphone", "electronics", "premium"],
    "attributes": {
      "color": "Midnight Black",
      "storage": "256GB",
      "ram": "12GB"
    }
  },
  {
    "id": "prod_002",
    "name": "Laptop UltraSlim 15",
    "description": "Portátil ultradelgada con procesador Intel Core i7 y pantalla 4K",
    "price": 1499.99,
    "currency": "USD",
    "category": "electronics",
    "stock": 25,
    "imageUrl": "https://example.com/images/laptop_ultraslim.jpg",
    "sku": "LUS-2024-002",
    "brand": "TechBrand",
    "rating": 4.8,
    "reviewCount": 256,
    "isAvailable": true,
    "tags": ["laptop", "electronics", "work"],
    "attributes": {
      "color": "Silver",
      "storage": "512GB SSD",
      "ram": "16GB"
    }
  },
  {
    "id": "prod_003",
    "name": "Auriculares Wireless Pro",
    "description": "Auriculares con cancelación activa de ruido y batería de 30 horas",
    "price": 299.99,
    "currency": "USD",
    "category": "accessories",
    "stock": 100,
    "imageUrl": "https://example.com/images/auriculares_pro.jpg",
    "sku": "AWP-2024-003",
    "brand": "AudioTech",
    "rating": 4.6,
    "reviewCount": 89,
    "isAvailable": true,
    "tags": ["audio", "wireless", "noise-cancelling"],
    "attributes": {
      "color": "White",
      "batteryLife": "30 hours",
      "connectivity": "Bluetooth 5.0"
    }
  },
  {
    "id": "prod_004",
    "name": "Smartwatch Fitness",
    "description": "Reloj inteligente con monitor de frecuencia cardíaca y GPS integrado",
    "price": 349.99,
    "currency": "USD",
    "category": "wearables",
    "stock": 75,
    "imageUrl": "https://example.com/images/smartwatch_fitness.jpg",
    "sku": "SWF-2024-004",
    "brand": "FitTech",
    "rating": 4.3,
    "reviewCount": 167,
    "isAvailable": true,
    "tags": ["wearable", "fitness", "gps"],
    "attributes": {
      "color": "Black",
      "waterResistance": "5ATM",
      "batteryLife": "7 days"
    }
  },
  {
    "id": "prod_005",
    "name": "Tablet Graphics 12",
    "description": "Tableta gráfica profesional con stylus de precisión y pantalla 2K",
    "price": 799.99,
    "currency": "USD",
    "category": "electronics",
    "stock": 15,
    "imageUrl": "https://example.com/images/tablet_graphics.jpg",
    "sku": "TGR-2024-005",
    "brand": "DrawTech",
    "rating": 4.7,
    "reviewCount": 54,
    "isAvailable": true,
    "tags": ["tablet", "graphics", "professional"],
    "attributes": {
      "color": "Space Gray",
      "storage": "256GB",
      "screenSize": "12.9 inches"
    }
  }
]

// === ARCHIVO: test/fixtures/transaction.json ===
{
  "transactions": [
    {
      "id": "txn_001",
      "userId": "user_123",
      "items": [
        {
          "productId": "prod_001",
          "productName": "Smartphone Pro X",
          "quantity": 1,
          "unitPrice": 999.99,
          "subtotal": 999.99
        },
        {
          "productId": "prod_003",
          "productName": "Auriculares Wireless Pro",
          "quantity": 2,
          "unitPrice": 299.99,
          "subtotal": 599.98
        }
      ],
      "subtotal": 1599.97,
      "tax": 159.99,
      "shipping": 15.00,
      "total": 1774.96,
      "currency": "USD",
      "status": "completed",
      "paymentMethod": "credit_card",
      "paymentCardLast4": "4242",
      "shippingAddress": {
        "street": "123 Main Street",
        "city": "San Francisco",
        "state": "CA",
        "zipCode": "94102",
        "country": "USA"
      },
      "billingAddress": {
        "street": "123 Main Street",
        "city": "San Francisco",
        "state": "CA",
        "zipCode": "94102",
        "country": "USA"
      },
      "createdAt": "2024-01-15T10:30:00Z",
      "updatedAt": "2024-01-15T10:35:00Z",
      "completedAt": "2024-01-15T10:35:00Z"
    },
    {
      "id": "txn_002",
      "userId": "user_456",
      "items": [
        {
          "productId": "prod_002",
          "productName": "Laptop UltraSlim 15",
          "quantity": 1,
          "unitPrice": 1499.99,
          "subtotal": 1499.99
        }
      ],
      "subtotal": 1499.99,
      "tax": 149.99,
      "shipping": 0.00,
      "total": 1649.98,
      "currency": "USD",
      "status": "pending",
      "paymentMethod": "paypal",
      "paymentEmail": "user@example.com",
      "shippingAddress": {
        "street": "456 Oak Avenue",
        "city": "New York",
        "state": "NY",
        "zipCode": "10001",
        "country": "USA"
      },
      "billingAddress": {
        "street": "456 Oak Avenue",
        "city": "New York",
        "state": "NY",
        "zipCode": "10001",
        "country": "USA"
      },
      "createdAt": "2024-01-16T14:20:00Z",
      "updatedAt": "2024-01-16T14:20:00Z",
      "completedAt": null
    },
    {
      "id": "txn_003",
      "userId": "user_789",
      "items": [
        {
          "productId": "prod_004",
          "productName": "Smartwatch Fitness",
          "quantity": 1,
          "unitPrice": 349.99,
          "subtotal": 349.99
        },
        {
          "productId": "prod_005",
          "productName": "Tablet Graphics 12",
          "quantity": 1,
          "unitPrice": 799.99,
          "subtotal": 799.99
        }
      ],
      "subtotal": 1149.98,
      "tax": 114.99,
      "shipping": 25.00,
      "total": 1289.97,
      "currency": "USD",
      "status": "failed",
      "paymentMethod": "credit_card",
      "paymentCardLast4": "1234",
      "failureReason": "Payment declined by issuer",
      "shippingAddress": {
        "street": "789 Pine Road",
        "city": "Seattle",
        "state": "WA",
        "zipCode": "98101",
        "country": "USA"
      },
      "billingAddress": {
        "street": "789 Pine Road",
        "city": "Seattle",
        "state": "WA",
        "zipCode": "98101",
        "country": "USA"
      },
      "createdAt": "2024-01-17T09:15:00Z",
      "updatedAt": "2024-01-17T09:16:00Z",
      "completedAt": null
    }
  ],
  "pagination": {
    "currentPage": 1,
    "pageSize": 10,
    "totalItems": 3,
    "totalPages": 1
  }
}

// === ARCHIVO: analysis_options.yaml ===
include: package:flutter_lints/flutter.yaml

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
    - "build/**"
    - "lib/generated/**"
    - "test/.test_coverage.dart"
    - "coverage/**"
  
  errors:
    invalid_annotation_target: ignore
    missing_required_param: error
    missing_return: error
    todo: ignore
    unused_import: warning
    unused_local_variable: warning
    prefer_const_constructors: warning
    prefer_const_literals_to_create_immutables: warning
    avoid_print: warning
    avoid_dynamic_calls: warning
    avoid_empty_else: error
    avoid_relative_lib_imports: warning
    avoid_returning_null_for_future: error
    avoid_slow_async_io: warning
    avoid_types_as_parameter_names: warning
    await_only_futures: error
    cancel_subscriptions: error
    close_sinks: warning
    constant_identifier_names: warning
    empty_catches: warning
    empty_constructor_bodies: warning
    empty_statements: warning
    hash_and_equals: warning
    implementation_imports: warning
    no_duplicate_case_values: error
    non_constant_identifier_names: warning
    null_closures: warning
    prefer_contains: warning
    prefer_final_fields: warning
    prefer_final_locals: warning
    prefer_if_null_operators: warning
    prefer_is_empty: warning
    prefer_is_not_empty: warning
    prefer_null_aware_operators: warning
    prefer_single_quotes: warning
    unnecessary_brace_in_string_interps: warning
    unnecessary_const: warning
    unnecessary_new: warning
    unnecessary_null_aware_assignments: warning
    unnecessary_null_in_if_null_operators: warning
    unnecessary_this: warning
    unrelated_type_equality_checks: error
    use_key_in_widget_constructors: warning
    use_rethrow_when_possible: warning
    valid_regexps: warning
  
  language:
    strict-casts: true
    strict-inference: true
    strict-raw-types: true

linter:
  rules:
    - always_declare_return_types
    - always_put_control_body_on_new_line
    - always_put_required_named_parameters_first
    - always_require_non_null_named_parameters
    - always_use_package_imports
    - annotate_overrides
    - avoid_empty_else
    - avoid_init_to_null
    - avoid_null_checks_in_equality_operators
    - avoid_relative_lib_imports
    - avoid_returning_null
    - avoid_returning_null_for_future
    - avoid_returning_null_for_void
    - avoid_slow_async_io
    - avoid_types_as_parameter_names
    - avoid_unnecessary_containers
    - avoid_unused_constructor_parameters
    - avoid_void_async
    - await_only_futures
    - cancel_subscriptions
    - close_sinks
    - constant_identifier_names
    - empty_catches
    - empty_constructor_bodies
    - empty_statements
    - hash_and_equals
    - implementation_imports
    - no_duplicate_case_values
    - non_constant_identifier_names
    - null_closures
    - prefer_contains
    - prefer_const_constructors
    - prefer_const_constructors_in_immutables
    - prefer_const_declarations
    - prefer_const_literals_to_create_immutables
    - prefer_contains
    - prefer_final_fields
    - prefer_final_in_for_each
    - prefer_final_locals
    - prefer_if_null_operators
    - prefer_interpolation_to_compose_strings
    - prefer_is_empty
    - prefer_is_not_empty
    - prefer_null_aware_method_calls
    - prefer_null_aware_operators
    - prefer_single_quotes
    - prefer_spread_collections
    - recursive_getters
    - slash_for_doc_comments
    - type_init_formals
    - unawaited_futures
    - unnecessary_await_in_return
    - unnecessary_brace_in_string_interps
    - unnecessary_const
    - unnecessary_new
    - unnecessary_null_aware_assignments
    - unnecessary_null_aware_operator_on_extension_on_nullable
    - unnecessary_null_checks
    - unnecessary_null_in_if_null_operators
    - unnecessary_overrides
    - unnecessary_parenthesis
    - unnecessary_string_escapes
    - unnecessary_string_interpolations
    - unnecessary_this
    - unrelated_type_equality_checks
    - use_build_context_synchronously
    - use_full_hex_values_for_flutter_colors
    - use_key_in_widget_constructors
    - use_late_for_private_fields_when_needed
    - use_named_constants
    - use_raw_strings
    - use_rethrow_when_possible
    - use_setters_to_change_properties
    - use_string_buffers
    - use_string_in_part_of_directives
    - valid_regexps
```

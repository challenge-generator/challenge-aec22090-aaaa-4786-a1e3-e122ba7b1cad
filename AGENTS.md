# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Implementación y diagnóstico de pruebas funcionales automatizadas en aplicaciones móviles**.

| | |
|---|---|
| Tema | técnicas de pruebas funcionales automatizadas y perfilamiento de aplicaciones |
| Nivel | master-l1 |
| Chapter | Móvil |
| Especialidad | Flutter |
| Stack | Dart / Flutter 3.27 |
| Patron arquitectonico | clean architecture con separación de capas y testing BDD |
| Tiempo estimado | 20 horas |

## Receta del stack

Esqueleto obligatorio:

- `pubspec.yaml en la raiz`
- `lib/main.dart con runApp`
- `lib/domain con entidades y repositorios abstractos`
- `lib/data con las implementaciones y el cliente Dio`
- `lib/presentation con screens y blocs/notifiers`

Dependencias:

- flutter_bloc 8.1.6
- equatable 2.0.5
- get_it 8.0.2
- dartz 0.10.1
- http 1.2.2
- gherkin n/a
- mocktail 1.0.4
- bloc_test 9.1.7
- flutter_test n/a
- integration_test n/a

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `flutter pub get && flutter analyze` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `flutter pub get && flutter analyze` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Configuración del entorno de pruebas**: Entorno de pruebas configurado y funcional.
- **Fase 2 — Implementación de pruebas funcionales utilizando BDD**: Conjunto de pruebas funcionales automatizadas utilizando BDD.
- **Fase 3 — Diagnóstico de bugs utilizando el perfilador de aplicaciones**: Informe de diagnóstico con recomendaciones para corregir bugs.
- **Fase 4 — Refactorización y optimización del código**: Código refactorizado y optimizado con pruebas funcionales actualizadas.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Superficie de practica (NO completes)

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs. No toques la logica que el reto pide completar.

- [ ] `test/unit/product_repository_test.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/unit/transaction_bloc_test.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/unit/get_products_usecase_test.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/integration/transaction_flow_test.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/e2e/app_navigation_test.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/bdd/features/products.feature` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/bdd/features/cart.feature` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/bdd/features/transaction.feature` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/bdd/step_definitions/product_steps.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/bdd/step_definitions/cart_steps.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/bdd/step_definitions/transaction_steps.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/bdd/test_helpers.dart` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/fixtures/products.json` — El topic pide TDD/pruebas: este archivo es el ejercicio.
- [ ] `test/fixtures/transaction.json` — El topic pide TDD/pruebas: este archivo es el ejercicio.

## Lo que falta y tenes que completar

### 1. Referencias colgando (12)

Salieron de un analisis estatico del codigo que SI esta en el repo. Cada una rompe la compilacion:

- [ ] `lib/data/models/transaction_model.dart` — `TransactionStatusModel.toLowerCase`
      Se invoca `toLowerCase` sobre `TransactionStatusModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `lib/data/models/transaction_model.dart` — `PaymentMethodModel.toLowerCase`
      Se invoca `toLowerCase` sobre `PaymentMethodModel`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `lib/data/repositories/product_repository_impl.dart` — `ProductRemoteDataSource.fetchProducts`
      Se invoca `fetchProducts` sobre `ProductRemoteDataSource`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `lib/data/repositories/product_repository_impl.dart` — `ProductRemoteDataSource.fetchProductById`
      Se invoca `fetchProductById` sobre `ProductRemoteDataSource`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `lib/data/repositories/transaction_repository_impl.dart` — `TransactionRemoteDataSource.fetchTransactions`
      Se invoca `fetchTransactions` sobre `TransactionRemoteDataSource`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `lib/data/repositories/transaction_repository_impl.dart` — `TransactionRemoteDataSource.fetchTransactionById`
      Se invoca `fetchTransactionById` sobre `TransactionRemoteDataSource`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `test/unit/product_repository_test.dart` — `MockProductRepository.getProducts`
      Se invoca `getProducts` sobre `MockProductRepository`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `test/unit/product_repository_test.dart` — `MockProductRepository.getProductById`
      Se invoca `getProductById` sobre `MockProductRepository`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `test/unit/product_repository_test.dart` — `MockProductRepository.searchProducts`
      Se invoca `searchProducts` sobre `MockProductRepository`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `test/unit/transaction_bloc_test.dart` — `TransactionBloc.close`
      Se invoca `close` sobre `TransactionBloc`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `test/unit/transaction_bloc_test.dart` — `TransactionBloc.add`
      Se invoca `add` sobre `TransactionBloc`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.
- [ ] `test/unit/get_products_usecase_test.dart` — `MockProductRepository.getProducts`
      Se invoca `getProducts` sobre `MockProductRepository`, pero esa clase no declara ese metodo. Agregalo con su implementacion real, o usa uno de los que si declara.

### Presentes (48)

- `pubspec.yaml`
- `lib/main.dart`
- `lib/core/constants/app_constants.dart`
- `lib/core/errors/failures.dart`
- `lib/core/errors/exceptions.dart`
- `lib/domain/entities/product.dart`
- `lib/domain/entities/cart.dart`
- `lib/domain/entities/transaction.dart`
- `lib/domain/repositories/product_repository.dart`
- `lib/domain/repositories/transaction_repository.dart`
- `lib/domain/usecases/get_products.dart`
- `lib/domain/usecases/add_to_cart.dart`
- `lib/domain/usecases/process_transaction.dart`
- `lib/data/models/product_model.dart`
- `lib/data/models/transaction_model.dart`
- `lib/data/datasources/product_remote_datasource.dart`
- `lib/data/datasources/transaction_remote_datasource.dart`
- `lib/data/repositories/product_repository_impl.dart`
- `lib/data/repositories/transaction_repository_impl.dart`
- `android/app/src/main/AndroidManifest.xml`
- `lib/presentation/blocs/product_bloc.dart`
- `lib/presentation/blocs/product_event.dart`
- `lib/presentation/blocs/product_state.dart`
- `lib/presentation/blocs/cart_bloc.dart`
- `lib/presentation/blocs/cart_event.dart`
- `lib/presentation/blocs/cart_state.dart`
- `lib/presentation/blocs/transaction_bloc.dart`
- `lib/presentation/blocs/transaction_event.dart`
- `lib/presentation/blocs/transaction_state.dart`
- `lib/presentation/screens/product_list_screen.dart`
- `lib/presentation/screens/cart_screen.dart`
- `lib/presentation/screens/checkout_screen.dart`
- `lib/presentation/widgets/product_card.dart`
- `test/unit/product_repository_test.dart`
- `test/unit/transaction_bloc_test.dart`
- `test/unit/get_products_usecase_test.dart`
- `test/integration/transaction_flow_test.dart`
- `test/e2e/app_navigation_test.dart`
- `test/bdd/features/products.feature`
- `test/bdd/features/cart.feature`
- `test/bdd/features/transaction.feature`
- `test/bdd/step_definitions/product_steps.dart`
- `test/bdd/step_definitions/cart_steps.dart`
- `test/bdd/step_definitions/transaction_steps.dart`
- `test/bdd/test_helpers.dart`
- `test/fixtures/products.json`
- `test/fixtures/transaction.json`
- `analysis_options.yaml`

### Capas del patron declarado

Cada una tiene que existir como directorio real con al menos un archivo. Codigo plano en la raiz no satisface el patron.

- `lib/core`
- `lib/domain/entities`
- `lib/domain/repositories`
- `lib/data/datasources`
- `lib/data/repositories`
- `lib/data/models`
- `lib/presentation/screens`
- `lib/presentation/blocs`
- `lib/presentation/widgets`
- `test/unit`
- `test/integration`
- `test/e2e`
- `test/bdd/features`
- `test/bdd/step_definitions`

## Verificacion

```bash
flutter pub get && flutter analyze
```

El comando tiene que pasar SIN implementar los archivos de la superficie de practica: solo andamiaje.

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **clean architecture con separación de capas y testing BDD**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter Movil, Especialidad Desarrollador, Tecnología Flutter, Master
- Brecha que el reto ataca: Realiza código aplicando BDD, enseña como hacer UT sencillo y UT de funcionalidades asincronas, diagnostica bugs con el perfilador (profiler) de apps, ha configurado servicios que corren pruebas funcionales Automatizadas en Diferentes Dispositivos
- Mision: Candidato con experiencia en desarrollo móvil avanzado, trabaja en contexto profesional

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*

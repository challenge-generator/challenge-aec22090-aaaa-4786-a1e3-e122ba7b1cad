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
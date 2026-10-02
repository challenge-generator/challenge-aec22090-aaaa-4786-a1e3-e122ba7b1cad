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
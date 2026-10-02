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
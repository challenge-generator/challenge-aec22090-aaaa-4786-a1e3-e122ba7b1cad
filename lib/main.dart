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
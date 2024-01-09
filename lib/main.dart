import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/features/login/presentation/bloc/auth/authentication_bloc.dart';
import 'package:rest_api/features/login/presentation/pages/splash_page.dart';

import 'features/home/data/data_source/remote_data_source.dart';
import 'features/home/data/repository/product.dart';
import 'features/home/domain/usecase/get_products.dart';
import 'features/home/presentation/bloc/product_bloc.dart';


void main() {
  runApp(const FakesStoreApp());
}

class FakesStoreApp extends StatelessWidget {
  const FakesStoreApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(GetProductsUseCase(
              ProductRepositoryImpl(HomeRemoteDataSource(Dio())))),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(),
        ),
      ],
      child: const MaterialApp(home: SplashScreen()),
    );
  }
}

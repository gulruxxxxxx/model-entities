import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/features/login/presentation/bloc/auth/authentication_bloc.dart';
import 'package:rest_api/features/login/presentation/login_screen.dart';

import '../../../home/presentation/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (_, state) {
        if (state.authenticationStatus == AuthenticationStatus.unknown) {
          context.read<AuthenticationBloc>().add(
            const AuthenticationEvent.getAuthenticatedStatus(),
          );
        } else if (state.authenticationStatus ==
            AuthenticationStatus.unauthenticated) {
          Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
          );
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (_) => const App()),
                (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state.authenticationStatus == AuthenticationStatus.unknown) {
          context.read<AuthenticationBloc>().add(
            const AuthenticationEvent.getAuthenticatedStatus(),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

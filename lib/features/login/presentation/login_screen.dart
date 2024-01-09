import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/authentication_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: ListView(
        children: [
          TextField(
            controller: userNameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          const SizedBox(height: 60,),
          MaterialButton(
            color: Colors.green,
              onPressed: (){
                context.read<AuthenticationBloc>().add(AuthenticationEvent.login(
                  username: userNameController.text,
                  password: passwordController.text,),);
              },
            child: Text('Login'),
              )
        ],
      ),
    );
  }
  @override
  void dispose(){
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

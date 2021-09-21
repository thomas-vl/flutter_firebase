import 'package:club_cloud/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: LoginForm(),
        //BlocProvider(
        //create: (_) => LoginCubit(context.read<Authentication>()),
        //child: const LoginForm(),
        //),
      ),
    );
  }
}

import 'package:club_cloud/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: Login());

  @override
  Widget build(BuildContext context) {
    LoginRouterDelegate _routerDelegate = LoginRouterDelegate();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider(
        create: (_) => LoginCubit(context.read<Authentication>()),
        child: Router(
          routerDelegate: _routerDelegate,
          //routeInformationParser: _routeInformationParser,
          //backButtonDispatcher: _backButtonDispatcher,
        ),

        //const LoginForm(),
      ),
    );
  }
}

import 'package:club_cloud/presentation/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth_repository/firebase_auth_repository.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider(
          create: (context) => LoginCubit(
            authentication:
                RepositoryProvider.of<FirebaseAuthRepository>(context),
          ),
          child: const Center(child: LoginForm()),
        ),
      );
}

import 'package:firebase_auth_repository/firebase_auth_repository.dart';
import 'package:club_cloud/presentation/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider(
          create: (context) => LoginCubit(
            authentication:
                RepositoryProvider.of<FirebaseAuthRepository>(context),
          ),
          child: const Center(child: LogOut()),
        ),
      );
}

class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: () => context.read<LoginCubit>().logOut(),
        child: const Text('LogOut'),
      );
    });
  }
}

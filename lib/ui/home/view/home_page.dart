import 'package:authentication_repository/authentication_repository.dart';
import 'package:club_cloud/ui/login/login.dart';
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
                RepositoryProvider.of<AuthenticationRepository>(context),
          ),
          child: Center(child: LogOut()),
        ),
      );
}

class LogOut extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return ElevatedButton(
        onPressed: () => context.read<LoginCubit>().logOut(),
        child: const Text('LogOut'),
      );
    });
  }
}

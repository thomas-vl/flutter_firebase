import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Login')),
  //     body: Padding(
  //       padding: const EdgeInsets.all(8),
  //       child: BlocProvider(
  //         create: (_) => LoginCubit(context.read<Authentication>()),
  //         child: const LoginForm(),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOME')),
      body: const Text('Hello'),
    );
  }
}

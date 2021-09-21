import 'package:club_cloud/services/auth.dart';
import 'package:club_cloud/ui/main/navigation/app_information_parser.dart';
import 'package:club_cloud/ui/main/navigation/app_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required Authentication authentication,
  })  : _authentication = authentication,
        super(key: key);

  final Authentication _authentication;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authentication,
      child: BlocProvider(
        create: (_) => AppBloc(
          authentication: _authentication,
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  AppView({Key? key}) : super(key: key);

  final AppRouterDelegate _routerDelegate = AppRouterDelegate();
  final AppInformationParser _routeInformationParser = AppInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

import 'package:authentication_repository/authentication_repository.dart';
import 'package:beamer/beamer.dart';
import 'package:club_cloud/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../navigation/beamer_locations.dart';

class App extends StatelessWidget {
  App({
    Key? key,
    required AuthenticationRepository authentication,
  })  : _authentication = authentication,
        super(key: key);

  final AuthenticationRepository _authentication;

  final routerDelegate = BeamerDelegate(
    guards: [
      // Guard /logged_in_page by beaming to /login if the user is unauthenticated:
      BeamGuard(
        pathBlueprints: ['/home'],
        check: (context, state) =>
            context.select((AuthBloc auth) => !auth.isAuthenticated()),
        beamToNamed: '/login',
      ),
    ],
    initialPath: '/home',
    locationBuilder: BeamerLocationBuilder(beamLocations: [
      AuthLocation(),
      //AppLocation(),
    ]),
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authentication,
      child: BlocProvider(
        create: (_) => AuthBloc(authentication: _authentication),
        child: BeamerProvider(
          routerDelegate: routerDelegate,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: routerDelegate,
            routeInformationParser: BeamerParser(),
          ),
        ),
      ),
    );
  }
}

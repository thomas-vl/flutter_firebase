import 'package:club_cloud/logic/cubit/sign_up_cubit.dart';
import 'package:firebase_auth_repository/firebase_auth_repository.dart';
import 'package:beamer/beamer.dart';
import 'package:club_cloud/logic/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation/beamer_locations.dart';

class App extends StatelessWidget {
  App({
    Key? key,
    required FirebaseAuthRepository authentication,
  })  : _authentication = authentication,
        super(key: key);

  final FirebaseAuthRepository _authentication;
  final routerDelegate = BeamerDelegate(
    guards: [
      // Guard /logged_in_page by beaming to /login if the user is unauthenticated:
      BeamGuard(
        pathBlueprints: ['/home'],
        check: (context, state) =>
            context.select((AuthBloc auth) => auth.isAuthenticated()),
        beamToNamed: '/login',
      ),
      BeamGuard(
        pathBlueprints: ['/login'],
        check: (context, state) {
          return context.select((AuthBloc auth) => !auth.isAuthenticated());
        },
        beamToNamed: '/home',
      ),
      BeamGuard(
        pathBlueprints: ['/sign_up'],
        check: (context, state) =>
            context.select((SignUpCubit signUp) => !signUp.isSignedUp()),
        beamToNamed: '/home',
      )
    ],
    initialPath: '/home',
    locationBuilder: BeamerLocationBuilder(beamLocations: [
      AppLocations(),
      //AppLocation(),
    ]),
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authentication,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => AuthBloc(authentication: _authentication)),
          BlocProvider(
              create: (_) => SignUpCubit(authentication: _authentication)),
        ],
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

import 'package:beamer/beamer.dart';
import 'package:club_cloud/ui/home/home.dart';
import 'package:club_cloud/ui/login/view/login_page.dart';
import 'package:club_cloud/ui/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

class AppLocations extends BeamLocation<BeamState> {
  AppLocations() : super();

  List<String> get pathPatterns => [
        '/home',
        '/login',
        '/sign_up',
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      if (state.uri.pathSegments.contains('home'))
        BeamPage(
            key: const ValueKey('home'),
            title: 'Home',
            child: const HomePage()),
      if (state.uri.pathSegments.contains('login'))
        BeamPage(
          key: const ValueKey('login'),
          title: 'Login',
          child: const LoginPage(),
        ),
      if (state.uri.pathSegments.contains('sign_up'))
        BeamPage(
          key: const ValueKey('sign_up'),
          title: 'Sign Up',
          child: const SignUpPage(),
        ),
    ];
  }

  @override
  List<String> get pathBlueprints => ['/home', '/login', '/sign_up'];
}

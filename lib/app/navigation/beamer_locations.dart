import 'package:beamer/beamer.dart';
import 'package:club_cloud/ui/home/home.dart';
import 'package:club_cloud/ui/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLocations extends BeamLocation<BeamState> {
  AppLocations() : super();

  List<String> get pathPatterns => [
        '/home',
        '/login',
        '/logged_in_page',
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
    ];
  }

  @override
  List<String> get pathBlueprints => ['/home', '/login'];
}

import 'package:beamer/beamer.dart';
import 'package:club_cloud/ui/home/home.dart';
import 'package:club_cloud/ui/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthLocation extends BeamLocation<BeamState> {
  AuthLocation() : super();

  List<String> get pathPatterns => [
        '/home',
        '/login',
        '/logged_in_page',
      ];

  @override
  // Widget builder(BuildContext context, Widget navigator) {
  //   // TODO: implement builder
  //   //print(context.read<Authentication>());
  //   return super.builder(context, navigator);
  // }

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
  // TODO: implement pathBlueprints
  List<String> get pathBlueprints => ['/home', '/login'];
}

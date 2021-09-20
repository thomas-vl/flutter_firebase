import '../bloc/app_bloc.dart';
import 'package:flutter/material.dart';

class AppRouteInformationParser extends RouteInformationParser<AppState> {
  @override
  Future<AppState> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    return const AppState.unauthenticated();
  }
}

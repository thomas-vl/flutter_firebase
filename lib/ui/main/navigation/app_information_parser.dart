import '../bloc/app_bloc.dart';
import 'package:flutter/material.dart';

class AppInformationParser extends RouteInformationParser<AppState> {
  @override
  Future<AppState> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    print("appR_router");
    print(routeInformation);
    return const AppState.unauthenticated();
  }
}

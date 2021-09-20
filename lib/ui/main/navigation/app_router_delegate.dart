import 'package:club_cloud/ui/home/home.dart';
import 'package:club_cloud/ui/login/login.dart';
import 'package:club_cloud/ui/main/bloc/app_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouterDelegate extends RouterDelegate<AppState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppState> {
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  List<Page> _getPages(AppState state) {
    List<Page> pages = [];
    if (state.status == AppStatus.authenticated) {
      pages.add(HomePage.page());
    } else {
      pages.add(LoginPage.page());
    }
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AppBloc>(context);
    return BlocListener(
      bloc: cubit,
      listener: (_, AppState state) {
        notifyListeners();
      },
      child: Navigator(
        pages: _getPages(cubit.state),
        onPopPage: (route, result) => false,
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(AppState config) async {
    notifyListeners();
  }
}

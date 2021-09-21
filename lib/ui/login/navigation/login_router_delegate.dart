import 'package:club_cloud/ui/login/cubit/login_cubit.dart';
import 'package:club_cloud/ui/login/login.dart';
import 'package:club_cloud/ui/sign_up/sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/login_page.dart';

class LoginRouterDelegate extends RouterDelegate<LoginState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<LoginState> {
  final GlobalKey<NavigatorState> navigatorKey;

  LoginRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  List<Page> _getPages(LoginState state) {
    List<Page<dynamic>> pages = [];
    if (state.signUp) {
      pages.add(SignUpPage.page());
    } else {
      pages.add(LoginPage.page());
    }

    // previousState.maybeWhen(
    //   orElse: () {},
    //   product: (product) {
    //     if (currentState == HomeState.cart()) {
    //       pages.add(ProductPage(product));
    //     }
    //   },
    // );

    // currentState.when(
    //   products: () {},
    //   product: (product) => pages.add(ProductPage(product)),
    //   cart: () => pages.add(CartPage()),
    // );

    return pages;
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<LoginCubit>(context);
    return BlocListener(
      bloc: cubit,
      listener: (_, LoginState state) {
        notifyListeners();
      },
      child: Navigator(
          pages: _getPages(cubit.state),
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }

            // cubit.state.when(products: () {
            //   cubit.navigateToProducts();
            // }, product: (_) {
            //   cubit.navigateToProducts();
            // }, cart: () {
            //   cubit.previousState.when(products: () {
            //     cubit.navigateToProducts();
            //   }, product: (product) {
            //     cubit.navigateToProduct(product);
            //   }, cart: () {
            //     cubit.navigateToProducts();
            //   });
            //});
            return true;
          }),
    );
  }

  @override
  Future<void> setNewRoutePath(LoginState state) async {
    notifyListeners();
  }
}

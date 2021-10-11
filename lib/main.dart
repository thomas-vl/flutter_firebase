import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:authentication_repository/authentication_repository.dart';

import 'app/app.dart';
import 'blocs/app_bloc_observer.dart';

Future<void> main() async {
  Bloc.observer = MainAppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authentication = AuthenticationRepository();
  await authentication.user.first;
  runApp(App(authentication: authentication));
}

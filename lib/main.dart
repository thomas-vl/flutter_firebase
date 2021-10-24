import 'package:firebase_auth_repository/firebase_auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'core/app.dart';
import 'logic/app_bloc_observer.dart';

Future<void> main() async {
  Bloc.observer = MainAppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authentication = FirebaseAuthRepository();
  await authentication.user.first;
  runApp(App(authentication: authentication));
}

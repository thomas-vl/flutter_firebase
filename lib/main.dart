import 'package:club_cloud/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';

import 'ui/main/view/app.dart';
import 'ui/main/app_bloc_observer.dart';

Future<void> main() async {
  Bloc.observer = MainAppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authentication = Authentication();
  await authentication.user.first;
  runApp(App(authentication: authentication));
}

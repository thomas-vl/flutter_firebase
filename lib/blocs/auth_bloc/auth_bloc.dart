import 'dart:async';

import 'package:firebase_auth_repository/firebase_auth_repository.dart';
import 'package:firebase_auth_repository/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required FirebaseAuthRepository authentication})
      : _authentication = authentication,
        super(
          authentication.currentUser.isNotEmpty
              ? AuthState.authenticated(authentication.currentUser)
              : const AuthState.unauthenticated(),
        ) {
    _userSubscription = _authentication.user.listen(_onUserChanged);
  }

  final FirebaseAuthRepository _authentication;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(User user) => add(AppUserChanged(user));

  bool isAuthenticated() => state.status == AuthStatus.authenticated;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppUserChanged) {
      yield _mapUserChangedToState(event, state);
    } else if (event is AppLogoutRequested) {
      unawaited(_authentication.logOut());
    }
  }

  AuthState _mapUserChangedToState(AppUserChanged event, AuthState state) {
    return event.user.isNotEmpty
        ? AuthState.authenticated(event.user)
        : const AuthState.unauthenticated();
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}

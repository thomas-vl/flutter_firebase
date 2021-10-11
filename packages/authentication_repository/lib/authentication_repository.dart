import 'models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class LogInWithEmailAndPasswordFailure implements Exception {}

class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  /// Whether or not the current environment is web
  /// Should only be overriden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;
  // User user = const User(id: '');

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.

  final firebase_auth.FirebaseAuth _firebaseAuth;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    print('THIS IS A BIG PROBLEM I NEED TO FIX THIS');
    var _user = User(id: "test");
    return _user;
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpFailure] if an exception occurs.
  Future<void> signUp({required String email, required String password}) async {
    // try {
    //   await _firebaseAuth.createUserWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );
    // } on Exception {
    //   throw SignUpFailure();
    // }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<void> logInWithGoogle() async {
    // try {
    //   late final firebase_auth.AuthCredential credential;
    //   if (isWeb) {
    //     final googleProvider = firebase_auth.GoogleAuthProvider();
    //     final userCredential = await _firebaseAuth.signInWithPopup(
    //       googleProvider,
    //     );
    //     credential = userCredential.credential!;
    //   } else {
    //     final googleUser = await _googleSignIn.signIn();
    //     final googleAuth = await googleUser!.authentication;
    //     credential = firebase_auth.GoogleAuthProvider.credential(
    //       accessToken: googleAuth.accessToken,
    //       idToken: googleAuth.idToken,
    //     );
    //   }

    //   await _firebaseAuth.signInWithCredential(credential);
    // } catch (_) {
    //   throw LogInWithGoogleFailure();
    // }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    //   try {
    //     await Future.wait([
    //       _firebaseAuth.signOut(),
    //       _googleSignIn.signOut(),
    //     ]);
    //   } on Exception {
    //     throw LogOutFailure();
    //   }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email);
  }
}

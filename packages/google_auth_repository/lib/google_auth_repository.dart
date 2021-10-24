import 'package:google_sign_in/google_sign_in.dart';
import 'models/models.dart';

class GoogleAuthRepository {
  GoogleAuthRepository({
    GoogleSignIn? googleSignIn,
  }) : _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final GoogleSignIn _googleSignIn;

  final User _user = const User(id: '');

  Stream<User> get user {
    _googleSignIn.signInSilently();
    return _googleSignIn.onCurrentUserChanged
        .map((GoogleSignInAccount? account) {
      return account == null ? User.empty : account.toUser;
    });
  }

  User get currentUser {
    return _user;
  }

  Future<void> logIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      throw LogInFailure.fromMessage(error.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

class LogOutFailure implements Exception {}

class LogInFailure implements Exception {
  const LogInFailure([
    this.message = "An unknown exception occured.",
  ]);

  factory LogInFailure.fromMessage(String message) {
    return LogInFailure(message);
  }

  final String message;
}

extension on GoogleSignInAccount {
  User get toUser {
    return User(
      id: id,
      email: email,
      name: displayName,
      photo: photoUrl,
      googleAccount: this,
    );
  }
}

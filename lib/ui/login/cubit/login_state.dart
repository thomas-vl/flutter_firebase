part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.signUp = false,
  });

  final Email email;
  final Password password;
  final FormzStatus status;
  final bool signUp;

  //const LoginState.signUp() : this(signUp: false);

  @override
  List<Object> get props => [email, password, status, signUp];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? signUp,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      signUp: signUp ?? this.signUp,
    );
  }
}

part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;

  const LoginState(
      {this.email = '',
      this.password = '',
      this.message = '',
      this.loginStatus = LoginStatus.INITIAL});

  LoginState copyWith(
      {String? email,
      String? password,
      String? message,
      LoginStatus? loginStatus}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        loginStatus: loginStatus ?? this.loginStatus,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [email, password, message, loginStatus];
}

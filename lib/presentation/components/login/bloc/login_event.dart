part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent{
  final String email;
  final String password;
  final bool rememberMe;
  LoginButtonPressed(this.email, this.password, this.rememberMe);

  @override
  List<Object> get props =>[email, password];
}
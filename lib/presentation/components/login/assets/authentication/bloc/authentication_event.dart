part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {
  final String email;

  AppStarted({this.email});
  @override
  List<Object> get props =>[];
}

class LoginTentative extends AuthenticationEvent {
  final String email;
  final String password;
  final bool rememberMe;

  LoginTentative(this.email, this.password, this.rememberMe);


  @override
  List<Object> get props => [email,password];
}

class LogOutTentative extends AuthenticationEvent {
  @override
  List<Object> get props =>[];
}

class LoginTentativeFailed extends AuthenticationEvent{
  @override
  List<Object> get props => [];
  
}
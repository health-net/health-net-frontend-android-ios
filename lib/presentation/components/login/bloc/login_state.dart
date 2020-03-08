part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "Initial state";
  }
}

class LoginTokenFetching extends LoginState{
  final String email, password;

  LoginTokenFetching(this.email, this.password);
  
  @override
  List<Object> get props =>[];

  @override
  String toString() {
    return "Validating provided credentials";
  }
}

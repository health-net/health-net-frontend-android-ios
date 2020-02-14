part of 'custom_loginform_bloc.dart';

abstract class CustomLoginformEvent extends Equatable {
  const CustomLoginformEvent();
}

class LoginButtonPressed extends CustomLoginformEvent{
  final String email;
  final String password;

  LoginButtonPressed(this.email, this.password);

  @override
  List<Object> get props =>[email, password];
}
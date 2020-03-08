part of 'user_registration_bloc.dart';

abstract class UserRegistrationEvent extends Equatable {
  const UserRegistrationEvent();
}

class UserRegistrationButtonPressed extends UserRegistrationEvent{
  final String fullName,eMail,password;

  UserRegistrationButtonPressed(this.fullName, this.eMail, this.password);

  @override
  List<Object> get props =>[fullName,eMail,password];
}
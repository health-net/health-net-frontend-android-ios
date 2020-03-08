part of 'user_registration_bloc.dart';

abstract class UserRegistrationState extends Equatable {
  const UserRegistrationState();
}

class UserRegistrationInitial extends UserRegistrationState {
  @override
  List<Object> get props => [];
}

class UserRegistrationFailed extends UserRegistrationState{
  final int statusCode;

  UserRegistrationFailed(this.statusCode);
  @override
  List<Object> get props =>[statusCode]; 
}

class UserRegistrationSuccess extends UserRegistrationState{
  @override
  List<Object> get props =>[];
  
}

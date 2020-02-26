part of 'custom_loginform_bloc.dart';

abstract class CustomLoginformState extends Equatable {
  const CustomLoginformState();
}

class CustomLoginformInitial extends CustomLoginformState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "Initial State";
  }
}

class CustomLoginLoading extends CustomLoginformState{
  final String email, password;

  CustomLoginLoading(this.email, this.password);
  
  @override
  List<Object> get props =>[];

  @override
  String toString() {
    return "Loading State";
  }
}

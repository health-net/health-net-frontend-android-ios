part of 'patients_bloc.dart';

abstract class PatientsState extends Equatable {
  const PatientsState();
}

class PatientsUninitializedState extends PatientsState {
  @override
  List<Object> get props => [];
}

class PatientsFetchingFailed extends PatientsState{
  final int statusCode;

  PatientsFetchingFailed(this.statusCode);
  @override
  List<Object> get props =>[statusCode];
  
}

class PatientsInitializedState extends PatientsState {
  final List<Patient> patients;

  PatientsInitializedState(this.patients);
  @override
  List<Object> get props =>[patients];
}
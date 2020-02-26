part of 'patient_registration_bloc.dart';

abstract class PatientRegistrationState extends Equatable {
  final String patientName;
  const PatientRegistrationState(this.patientName);
}

class PatientRegistrationInitial extends PatientRegistrationState {
  PatientRegistrationInitial(String patientName) : super(patientName);


  @override
  List<Object> get props => [];
}

class PatientRegistrationSuccess extends PatientRegistrationState{
  PatientRegistrationSuccess() : super(null);

  @override
  List<Object> get props =>[];

}

class PatientRegistrationFailed extends PatientRegistrationState{
  final int statusCode;

  PatientRegistrationFailed(this.statusCode, String patientName):super(patientName);
  
  @override
  List<Object> get props =>[];
  
}

class RegistrationCompleted extends PatientRegistrationState{
  RegistrationCompleted() : super(null);


  @override
  List<Object> get props =>[];

}
part of 'patient_registration_bloc.dart';

abstract class PatientRegistrationEvent extends Equatable {
  const PatientRegistrationEvent();
}

class RegistrationButtonPressed extends PatientRegistrationEvent{

  final Patient patient;

  RegistrationButtonPressed(this.patient);
  @override
  List<Object> get props =>[patient];
  
}

class RetryButtonPressed extends PatientRegistrationEvent{
  final String patientName;

  RetryButtonPressed(this.patientName);
  @override
  List<Object> get props =>[];
  
}

class PatientRegistrationCompleted extends PatientRegistrationEvent{
  @override
  List<Object> get props =>[];
  
}

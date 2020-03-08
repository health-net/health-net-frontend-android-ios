part of 'patients_bloc.dart';

abstract class PatientsEvent extends Equatable {
  const PatientsEvent();
}

class PatientsFetchingRequired extends PatientsEvent{
  @override
  List<Object> get props =>[];
}

class SpecificPatientSensorsDetailsRequired extends PatientsEvent{
  final Patient patient;

  SpecificPatientSensorsDetailsRequired(this.patient);
  @override
  List<Object> get props =>[patient];

}
/*
class PatientRegistrationFailedEvent extends MedicalRecordsEvent{
  final int statusCode;

  PatientRegistrationFailedEvent(this.statusCode);
  @override
  List<Object> get props =>[statusCode];
  
}
*/

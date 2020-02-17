part of 'medical_records_bloc.dart';

abstract class MedicalRecordsEvent extends Equatable {
  const MedicalRecordsEvent();
}

class PatientsFetchingRequired extends MedicalRecordsEvent{
  @override
  List<Object> get props =>[];
}

class SpecificPatientSensorsDetailsRequired extends MedicalRecordsEvent{
  final String patientUUID;

  SpecificPatientSensorsDetailsRequired(this.patientUUID);
  @override
  List<Object> get props =>[patientUUID];

}

class PatientRegistrationButtonPressed extends MedicalRecordsEvent{
  @override
  List<Object> get props =>[];
}

/*
class PatientRegistrationFailedEvent extends MedicalRecordsEvent{
  final int statusCode;

  PatientRegistrationFailedEvent(this.statusCode);
  @override
  List<Object> get props =>[statusCode];
  
}
*/

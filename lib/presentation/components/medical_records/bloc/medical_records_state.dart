part of 'medical_records_bloc.dart';

abstract class MedicalRecordsState extends Equatable {
  const MedicalRecordsState();
}

class MedicalRecordsUninitialized extends MedicalRecordsState {
  @override
  List<Object> get props => [];
}

class MedicalRecordsInitialized extends MedicalRecordsState {
  final List<Patient> patients;

  MedicalRecordsInitialized(this.patients);
  @override
  List<Object> get props =>[patients];
}

class MedicalRecordsFetchingFailed extends MedicalRecordsState{
  final int statusCode;

  MedicalRecordsFetchingFailed(this.statusCode);
  @override
  List<Object> get props =>[statusCode];
  
}

class PatientRegistrationPopupShowing extends MedicalRecordsState{
  @override
  List<Object> get props =>[];
}

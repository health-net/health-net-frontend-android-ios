part of 'patient_registration_dialog_bloc.dart';

abstract class PatientRegistrationDialogEvent extends Equatable {
  const PatientRegistrationDialogEvent();
}

class ShowPatientRegistration extends PatientRegistrationDialogEvent{
  @override
  List<Object> get props =>[];
}

class HidePatientRegistration extends PatientRegistrationDialogEvent{
  @override
  List<Object> get props =>[];
}

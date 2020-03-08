import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'patient_registration_dialog_event.dart';
part 'patient_registration_dialog_state.dart';

class PatientRegistrationDialogBloc extends Bloc<PatientRegistrationDialogEvent, PatientRegistrationDialogState> {
  void show() => add(ShowPatientRegistration());
  void hide() => add(HidePatientRegistration());
  @override
  PatientRegistrationDialogState get initialState => PatientRegistrationDialogHiding();

  @override
  Stream<PatientRegistrationDialogState> mapEventToState(
    PatientRegistrationDialogEvent event,
  ) async* {
    if(event is ShowPatientRegistration)
    {
      yield PatientRegistrationDialogShowing();
    }

    if(event is HidePatientRegistration)
    {
      yield PatientRegistrationDialogHiding();
    }
  }
}

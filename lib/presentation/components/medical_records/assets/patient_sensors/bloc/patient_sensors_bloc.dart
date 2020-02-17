import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'patient_sensors_event.dart';
part 'patient_sensors_state.dart';

class PatientSensorsBloc extends Bloc<PatientSensorsEvent, PatientSensorsState> {
  @override
  PatientSensorsState get initialState => PatientSensorsInitial();

  @override
  Stream<PatientSensorsState> mapEventToState(
    PatientSensorsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

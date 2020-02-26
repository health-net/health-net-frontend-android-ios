import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/device.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/rest_devices_handler.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';

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

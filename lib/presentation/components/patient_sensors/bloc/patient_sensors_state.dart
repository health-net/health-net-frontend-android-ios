part of 'patient_sensors_bloc.dart';

abstract class PatientSensorsState extends Equatable {
}

class PatientSensorsUninitialized extends PatientSensorsState {

  @override
  List<Object> get props => [];
}

class PatientSensorsFetchingFailed extends PatientSensorsState {
  final int errorCode;
  PatientSensorsFetchingFailed(this.errorCode);

  @override
  List<Object> get props => [];
}


class PatientSensorsInitializedState extends PatientSensorsState {
  final List<Device> devices;
  final String authTok;

  PatientSensorsInitializedState(this.devices, this.authTok);
  @override
  List<Object> get props => [devices];
}



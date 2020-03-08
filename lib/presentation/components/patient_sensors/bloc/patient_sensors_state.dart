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

  PatientSensorsInitializedState(this.devices);
  @override
  List<Object> get props => [devices];
}

class PatientSensorsDeviceSelectedState extends PatientSensorsState{
  final Patient patient;
  final String deviceId;
  final List<DeviceNode> deviceNodes;

  PatientSensorsDeviceSelectedState(this.deviceId,this.deviceNodes, this.patient);
  
  @override
  List<Object> get props =>[patient,deviceNodes];
}

class PatientSensorsDeviceNodeSelectedState extends PatientSensorsState{
    final Patient patient;
  final String deviceId, deviceNodeId;
  final List<DeviceNodeProperty> deviceNodeProperties;
  final String authToken;

  PatientSensorsDeviceNodeSelectedState(this.deviceNodeProperties, this.deviceId, this.deviceNodeId, this.authToken, this.patient);

  @override
  List<Object> get props =>[deviceNodeProperties];
}



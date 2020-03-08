part of 'patient_sensors_bloc.dart';

abstract class PatientSensorsEvent extends Equatable {
    final Patient patient;
  const PatientSensorsEvent(this.patient);
}

class PatientSensorsFetchingRequiredEvent extends PatientSensorsEvent{
  PatientSensorsFetchingRequiredEvent(Patient patient) : super(patient);
  @override
  List<Object> get props =>[patient]; 
}

class PatientDeviceSelectedEvent extends PatientSensorsEvent{
  final Device device;

  PatientDeviceSelectedEvent(Patient patient, this.device) : super(patient);

  @override
  List<Object> get props =>[device,patient]; 
}

class PatientDeviceNodeSelectedEvent extends PatientSensorsEvent{
  final String deviceId;
  final DeviceNode deviceNode;

  PatientDeviceNodeSelectedEvent(Patient patient, this.deviceId, this.deviceNode) : super(patient);
  @override
  List<Object> get props =>[deviceNode]; 
}

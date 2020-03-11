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


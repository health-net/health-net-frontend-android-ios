part of 'patient_sensors_bloc.dart';

abstract class PatientSensorsState extends Equatable {
  const PatientSensorsState();
}

class PatientSensorsInitial extends PatientSensorsState {
  @override
  List<Object> get props => [];
}

import 'package:equatable/equatable.dart';

abstract class MedicalRecordsState extends Equatable {
  const MedicalRecordsState();
  List<Object> get props => [];
}

class UnfetchedMedicalRecordsState extends MedicalRecordsState {
}

class FetchingMedicalRecordsState extends MedicalRecordsState {
}

class FetchedMedicalRecordsState extends MedicalRecordsState {
}
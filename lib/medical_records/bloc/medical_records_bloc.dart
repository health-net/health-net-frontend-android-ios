import 'dart:async';
import 'package:bloc/bloc.dart';
import '../medical_records.dart';

class MedicalRecordsBloc extends Bloc<MedicalRecordsEvent, MedicalRecordsState> {
  @override
  MedicalRecordsState get initialState => UnfetchedMedicalRecordsState();

  @override
  Stream<MedicalRecordsState> mapEventToState(
    MedicalRecordsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

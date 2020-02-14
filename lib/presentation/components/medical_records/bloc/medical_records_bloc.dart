import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'medical_records_event.dart';
part 'medical_records_state.dart';

class MedicalRecordsBloc extends Bloc<MedicalRecordsEvent, MedicalRecordsState> {
  @override
  MedicalRecordsState get initialState => MedicalRecordsInitial();

  @override
  Stream<MedicalRecordsState> mapEventToState(
    MedicalRecordsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

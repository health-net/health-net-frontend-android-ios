import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/rest_patients_handler.dart';

part 'medical_records_event.dart';
part 'medical_records_state.dart';

class MedicalRecordsBloc extends Bloc<MedicalRecordsEvent, MedicalRecordsState> {
  @override
  MedicalRecordsState get initialState => MedicalRecordsUninitialized();

  @override
  Stream<MedicalRecordsState> mapEventToState(
    MedicalRecordsEvent event,
  ) async* {
    if(event is PatientsFetchingRequired)
      {
        List<Patient> result;
        try{
          result=await PatientHandler().getAllPatients();
        } on RESTAPIConsumptionException catch(excep)
        {
          yield MedicalRecordsFetchingFailed(excep.getStatusCode());
        }on SocketException catch(excep){
          yield MedicalRecordsFetchingFailed(excep.osError.errorCode);
        }
          yield MedicalRecordsInitialized(result);
      }
    
    if(event is PatientRegistrationButtonPressed)
    {
      yield PatientRegistrationPopupShowing();
    }

    if(event is SpecificPatientSensorsDetailsRequired)
    {

    }
  }
}

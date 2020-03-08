import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_net_frontend_android_ios/logic/repository/user_repository/user_repository.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/rest_patients_handler.dart';

part 'patients_event.dart';
part 'patients_state.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  @override
  PatientsState get initialState => PatientsUninitializedState();

  @override
  Stream<PatientsState> mapEventToState(
    PatientsEvent event,
  ) async* {
    var userRepo = new UserRepository();
    if(event is PatientsFetchingRequired)
      {
        List<Patient> result;
        try{
          result=await PatientHandler().getAllPatients(await userRepo.getTokenByKey("authToken"));
          yield PatientsInitializedState(result);
        }on SocketException catch(excep){
          yield PatientsFetchingFailed(excep.osError.errorCode);
        }on RESTAPIConsumptionException catch(excep)
        { 
          yield PatientsFetchingFailed(excep.getStatusCode());
        }
      }
  }
}

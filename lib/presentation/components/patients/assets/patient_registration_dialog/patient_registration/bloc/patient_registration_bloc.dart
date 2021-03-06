import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_net_frontend_android_ios/logic/repository/user_repository/user_repository.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/rest_patients_handler.dart';

part 'patient_registration_event.dart';
part 'patient_registration_state.dart';

class PatientRegistrationBloc extends Bloc<PatientRegistrationEvent, PatientRegistrationState> {
  @override
  PatientRegistrationState get initialState => PatientRegistrationInitial("");

  @override
  Stream<PatientRegistrationState> mapEventToState(
    PatientRegistrationEvent event,
  ) async* {
    var userRepo = new UserRepository();
    if(event is RegistrationButtonPressed)
      {
        try{
          await PatientHandler().registerPatient(event.patient,await userRepo.getTokenByKey("authToken"));
          yield PatientRegistrationSuccess();
        } on RESTAPIConsumptionException catch(e){
          yield PatientRegistrationFailed(e.getStatusCode(), event.patient.getFullName());
        } on SocketException catch(e){
          yield PatientRegistrationFailed(e.osError.errorCode, event.patient.getFullName());         
        }
      }

    if(event is RetryButtonPressed)
      {
        yield PatientRegistrationInitial(event.patientName);
      }

    

  }
}

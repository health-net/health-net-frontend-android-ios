import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_net_frontend_android_ios/logic/repository/user_repository/user_repository.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/device.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/device_node.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/device_node_property.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/rest_devices_handler.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';

part 'patient_sensors_event.dart';
part 'patient_sensors_state.dart';

class PatientSensorsBloc
    extends Bloc<PatientSensorsEvent, PatientSensorsState> {
  @override
  PatientSensorsState get initialState => PatientSensorsUninitialized();
  @override
  Stream<PatientSensorsState> mapEventToState(
    PatientSensorsEvent event,
  ) async* {
    var userRepo = new UserRepository();
    String tok = await userRepo.getTokenByKey("authToken");
    if (event is PatientSensorsFetchingRequiredEvent) {
      try {
        List<Device> result=await DevicesInformationHandler()
            .getDevicesInformationByPatientID(event.patient.getId(), tok);
        yield PatientSensorsInitializedState(result, tok);
      } on RESTAPIConsumptionException catch (excep) {
        yield PatientSensorsFetchingFailed(excep.getStatusCode());
      } on SocketException catch (excep) {
        yield PatientSensorsFetchingFailed(excep.osError.errorCode);
      }
    }
  }
}

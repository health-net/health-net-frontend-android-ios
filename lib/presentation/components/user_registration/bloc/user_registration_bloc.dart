import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_net_frontend_android_ios/logic/repository/user_repository/user_repository.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'package:health_net_frontend_android_ios/logic/rest/registration/rest_user_handler.dart';

part 'user_registration_event.dart';
part 'user_registration_state.dart';

class UserRegistrationBloc extends Bloc<UserRegistrationEvent, UserRegistrationState> {
  @override
  UserRegistrationState get initialState => UserRegistrationInitial();

  @override
  Stream<UserRegistrationState> mapEventToState(
    UserRegistrationEvent event,
  ) async* {
    var userHandler = UserHandler();
    var userRepo=UserRepository();
    if(event is UserRegistrationButtonPressed)
    {
      String tok = await userRepo.getTokenByKey("authToken");
      try{
        await userHandler.sendRegistrationRequest(event.fullName, event.eMail, event.password, tok);
        yield UserRegistrationSuccess();      
      }on RESTAPIConsumptionException catch(excep){
        yield UserRegistrationFailed(excep.getStatusCode());
      }on SocketException catch(excep){
        yield UserRegistrationFailed(excep.osError.errorCode);
      }

    }
  }
}

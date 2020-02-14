import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_net_frontend_android_ios/logic/repository/user_repository/user_repository.dart';
import 'package:health_net_frontend_android_ios/logic/rest/authentication/rest_authentication_handler.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepo = new UserRepository();
  final AuthenticationHandler authHandler = new AuthenticationHandler();

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if(event is AppStarted)
    {
      String authTok = await userRepo.getTokenByKey('auth_token');
        if(![null,""].contains(authTok)&&await authHandler.checkValidToken(authTok))
        yield AuthenticationAuthenticated(authTok);
      else
        yield AuthenticationUnauthenticated();      
    }

    if(event is LoginTentative)
    {
      String token;
      try{
        token=await authHandler.sendAuthenticationRequest(event.email, event.password);
        userRepo.setNewToken('auth_token', token);
        yield AuthenticationAuthenticated(token);
      } on RESTAPIConsumptionException catch(e){
        yield AuthenticationFailed(e.getStatusCode());
      } on SocketException catch(e){
        yield AuthenticationFailed(e.osError.errorCode);
      }
    }

    if(event is LogOutTentative)
    {
      //authHandler.sendDeauthenticationRequest();
      userRepo.deleteTokenByKey('auth_token');
      yield AuthenticationUnauthenticated();
    }

    if(event is LoginTentativeFailed)
    {
      yield AuthenticationUnauthenticated();
    }
    }
  }

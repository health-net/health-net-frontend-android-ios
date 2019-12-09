import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/repository/login_repository.dart';
import '../authentication.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository authRepo;
   AuthenticationBloc({@required this.authRepo}): assert(authRepo != null);
  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if(event is AppStarted)
      {
        final bool tokenExist = await authRepo.hasToken();

        if(tokenExist){
          yield AuthenticationAuthenticated(); //SESSIONE PRECEDENTEMENTE ATTIVA ANCORA VALIDA
        }
        else
        {
          yield AuthenticationUnauthenticated(); //SESSIONE NON VALIDA. LOGIN DA EFFETTUARE
        }

      }
    
    if(event is LoggedIn)
    {
      yield AuthenticationLoading();
      await authRepo.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if(event is LoggedOut)
    {
      yield AuthenticationLoading();
      await authRepo.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}

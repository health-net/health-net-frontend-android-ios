import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/authentication/authentication.dart';
import 'package:health_net_frontend_android_ios/repository/login_repository.dart';
import '../login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository loginRepo;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.loginRepo,
    @required this.authenticationBloc,
  })  : assert(loginRepo != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await loginRepo.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
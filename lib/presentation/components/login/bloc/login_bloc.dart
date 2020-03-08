import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {


  //Interfaces to obtain a state change
  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(event is LoginButtonPressed)
    {
        if(event.rememberMe)
          prefs.setString("email", event.email);
        else
          prefs.setString("email", null);
          
        yield LoginTokenFetching(event.email, event.password);

    }
  }
}

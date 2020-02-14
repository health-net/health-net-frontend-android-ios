import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'custom_loginform_event.dart';
part 'custom_loginform_state.dart';

class CustomLoginFormBloc extends Bloc<CustomLoginformEvent, CustomLoginformState> {


  //Interfaces to obtain a state change
  @override
  CustomLoginformState get initialState => CustomLoginformInitial();

  @override
  Stream<CustomLoginformState> mapEventToState(
    CustomLoginformEvent event,
  ) async* {
    if(event is LoginButtonPressed)
    {
        yield CustomLoginLoading(event.email, event.password);

    }
  }
}

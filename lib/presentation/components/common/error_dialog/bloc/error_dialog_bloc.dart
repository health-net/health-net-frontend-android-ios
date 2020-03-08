import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/assets/network_error_element.dart';

part 'error_dialog_event.dart';
part 'error_dialog_state.dart';

class ErrorDialogBloc extends Bloc<ErrorDialogEvent, ErrorDialogState> {
  void show(IconData icon, int errorCode) => add(ShowErrorDialog(icon,errorCode));
  void hide() => add(HideErrorDialog());
  
  @override
  ErrorDialogState get initialState => ErrorDialogHiding();

  @override
  Stream<ErrorDialogState> mapEventToState(
    ErrorDialogEvent event,
  ) async* {
    if(event is ShowErrorDialog)
    {
      yield ErrorDialogShowing.fromParams(event.dialogIcon, event.errorCode);
    }

    if(event is HideErrorDialog)
    {
      yield ErrorDialogHiding();
    }
  }
}

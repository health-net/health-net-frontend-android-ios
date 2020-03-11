import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_dialog_event.dart';
part 'loading_dialog_state.dart';

class LoadingDialogBloc extends Bloc<LoadingDialogEvent, LoadingDialogState> {
  void show() =>add(ShowLoadingDialog());
  void hide() =>add(HideLoadingDialog());
   bool _showing=false;
  @override
  LoadingDialogState get initialState => LoadingDialogHiding();

  @override
  Stream<LoadingDialogState> mapEventToState(
    LoadingDialogEvent event,
  ) async* {
    if(event is ShowLoadingDialog&&!_showing)
    {
      yield LoadingDialogShowing();
      _showing=true;
    }

    if(event is HideLoadingDialog&&_showing)
    {
      yield LoadingDialogHiding();
      _showing=false;
    }
  }
}

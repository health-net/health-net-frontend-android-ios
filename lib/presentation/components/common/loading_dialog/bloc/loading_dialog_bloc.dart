import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loading_dialog_event.dart';
part 'loading_dialog_state.dart';

class LoadingDialogBloc extends Bloc<LoadingDialogEvent, LoadingDialogState> {
  void show() =>add(ShowLoadingDialog());
  void hide() =>add(HideLoadingDialog());
  @override
  LoadingDialogState get initialState => LoadingDialogHiding();

  @override
  Stream<LoadingDialogState> mapEventToState(
    LoadingDialogEvent event,
  ) async* {
    if(event is ShowLoadingDialog)
    {
      yield LoadingDialogShowing();
    }

    if(event is HideLoadingDialog)
    {
      yield LoadingDialogHiding();
    }
  }
}

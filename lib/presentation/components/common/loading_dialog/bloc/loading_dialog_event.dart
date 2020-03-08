part of 'loading_dialog_bloc.dart';

abstract class LoadingDialogEvent extends Equatable {
  const LoadingDialogEvent();
}

class ShowLoadingDialog extends LoadingDialogEvent{
  @override
  List<Object> get props =>[];
}

class HideLoadingDialog extends LoadingDialogEvent{
  @override
  List<Object> get props =>[];
}
part of 'loading_dialog_bloc.dart';

abstract class LoadingDialogState extends Equatable {
  const LoadingDialogState();
}

class LoadingDialogShowing extends LoadingDialogState {
  LoadingDialogShowing() : super();

  @override
  List<Object> get props => [];
}

class LoadingDialogHiding extends LoadingDialogState{
  LoadingDialogHiding() : super();

  @override
  List<Object> get props =>[];
  
}

part of 'loading_dialog_bloc.dart';

abstract class LoadingDialogState extends Equatable {
  final bool showing;
  const LoadingDialogState(this.showing);
}

class LoadingDialogShowing extends LoadingDialogState {
  LoadingDialogShowing() : super(true);

  @override
  List<Object> get props => [];
}

class LoadingDialogHiding extends LoadingDialogState{
  LoadingDialogHiding() : super(false);

  @override
  List<Object> get props =>[];
  
}

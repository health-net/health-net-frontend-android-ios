part of 'error_dialog_bloc.dart';

abstract class ErrorDialogState extends Equatable {
  const ErrorDialogState();
}

class ErrorDialogShowing extends ErrorDialogState {
  final Dialog dialog;

  ErrorDialogShowing(this.dialog);
  
  factory ErrorDialogShowing.fromParams(IconData titleIcon, int errorCode){
    return ErrorDialogShowing(
      Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child:NetworkErrorElement(titleIcon, errorCode),
        ),
      );
  }

  @override
  List<Object> get props =>[dialog];
}

class ErrorDialogHiding extends ErrorDialogState{
  @override
  List<Object> get props =>[];
  
}

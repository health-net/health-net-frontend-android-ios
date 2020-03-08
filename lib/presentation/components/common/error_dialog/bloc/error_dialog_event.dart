part of 'error_dialog_bloc.dart';

abstract class ErrorDialogEvent extends Equatable {
  const ErrorDialogEvent();
}

class ShowErrorDialog extends ErrorDialogEvent{
  final IconData dialogIcon;
  final int errorCode;

  ShowErrorDialog(this.dialogIcon, this.errorCode);

  @override
  List<Object> get props =>[errorCode];

}

class HideErrorDialog extends ErrorDialogEvent{
  @override
  List<Object> get props =>[];
  
}
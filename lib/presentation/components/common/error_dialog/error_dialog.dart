import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/bloc/error_dialog_bloc.dart';

class GenericErrorDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorDialogBloc, ErrorDialogState>(
      listener:(context, state){
        if(state is ErrorDialogShowing)
        {
          WidgetsBinding.instance.addPostFrameCallback((duration) => {
              showDialog(
                context: context,
                barrierDismissible: false,
                child: WillPopScope(
                  child: BlocProvider.value(
                    value: BlocProvider.of<ErrorDialogBloc>(context),
                    child: state.dialog,),
                  onWillPop: ()async => false))
              });
        }
        if(state is ErrorDialogHiding)
        {
          Navigator.pop(context);
        }
      },
      child: Container(height:0.0,width:0.0),
      );
  }
  
}
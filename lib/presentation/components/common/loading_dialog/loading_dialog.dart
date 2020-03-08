import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/assets/loading_element.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/bloc/loading_dialog_bloc.dart';

class LoadingDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoadingDialogBloc, LoadingDialogState>(
      listener:(context, state){
        if(state is LoadingDialogShowing)
        {
          WidgetsBinding.instance.addPostFrameCallback((duration) => {
              showDialog(
                context: context,
                barrierDismissible: false,
                child: WillPopScope(
                  child: LoadingElement(),
                  onWillPop: ()async =>false))
              });
        }
        if(state is LoadingDialogHiding)
        {
          Navigator.pop(context);
        }
      },
      child:Container(height: 0.0,width: 0.0,)
      );
  }
  
}
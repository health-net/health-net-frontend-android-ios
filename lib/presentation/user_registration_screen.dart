import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/error_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/loading_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/user_registration/bloc/user_registration_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/user_registration/user_registration_form.dart';

import 'components/common/error_dialog/bloc/error_dialog_bloc.dart';
import 'components/common/loading_dialog/bloc/loading_dialog_bloc.dart';

class UserRegistrationScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<UserRegistrationBloc, UserRegistrationState>(
          listener: (context, state) {
            if (state is UserRegistrationSuccess) {
              BlocProvider.of<LoadingDialogBloc>(context).hide();
              Navigator.of(context).pop();
            }
            if(state is UserRegistrationFailed){
              BlocProvider.of<LoadingDialogBloc>(context).hide();
              BlocProvider.of<ErrorDialogBloc>(context)
                  .show(Icons.error_outline, state.statusCode);
            }

          },
          child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: MultiBlocProvider(providers: [
                    BlocProvider.value(
                        value: BlocProvider.of<LoadingDialogBloc>(context)),
                    BlocProvider.value(
                        value: BlocProvider.of<UserRegistrationBloc>(context)),
                    BlocProvider.value(value: BlocProvider.of<ErrorDialogBloc>(context))
                  ], child: UserRegistrationElements())),
                                BlocProvider.value(
                                    value: BlocProvider.of<LoadingDialogBloc>(context),
                                    child: LoadingDialog()),
                                BlocProvider.value(
                                  value: BlocProvider.of<ErrorDialogBloc>(context),
                                  child: GenericErrorDialog(),
                                ),
                              ],
                            ),
                          ));
                    }
                  }
                  
class UserRegistrationElements extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 80, bottom: 20),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 4,
                child: Image.asset('assets/logo/logo.png'),
              )
              ),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Text(
              'HEALTH-NET',
              style: Theme.of(context).textTheme.display2
            )
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Text(
              'Register a new user:',
              style: Theme.of(context).textTheme.display1
            ),
          ),
          Center(
            child: Container(
                height: 450,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColorLight, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: MultiBlocProvider(providers: [
                  BlocProvider.value(
                      value: BlocProvider.of<UserRegistrationBloc>(context)),
                  BlocProvider.value(
                      value: BlocProvider.of<LoadingDialogBloc>(context)),
                  BlocProvider.value(value: BlocProvider.of<ErrorDialogBloc>(context))
                ], child: UserRegistrationForm())),
          ),
        ])
    );
  }
}
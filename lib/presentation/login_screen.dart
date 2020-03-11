import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/bloc/error_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/error_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/bloc/loading_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/loading_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login/assets/authentication/bloc/authentication_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login/assets/login_form.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/bloc/patients_bloc.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
           listener: (context, state) {
            if(state is AuthenticationUnauthenticated)
            {
              BlocProvider.of<LoadingDialogBloc>(context).hide();
            }
            if (state is AuthenticationAuthenticated) {
              BlocProvider.of<PatientsBloc>(context).add(PatientsFetchingRequired());
              BlocProvider.of<LoadingDialogBloc>(context).hide();
              BlocProvider.of<ErrorDialogBloc>(context).close();
              Navigator.pushNamed(context, "/patients");
            }
            if(state is AuthenticationFailed){
              BlocProvider.of<LoadingDialogBloc>(context).hide();
              BlocProvider.of<ErrorDialogBloc>(context).show(Icons.error_outline, state.statusCode);
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
                        value: BlocProvider.of<AuthenticationBloc>(context))
                  ], child: LoginScreenElements())),
              BlocProvider.value(
                  value: BlocProvider.of<LoadingDialogBloc>(context),
                  child: LoadingDialog()),
              BlocProvider.value(
                value: BlocProvider.of<ErrorDialogBloc>(context),
                child: GenericErrorDialog(),
              ),
            ],
          ),
          ),
        );
  }
}

class LoginScreenElements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child:Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 80, bottom: 20),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.width / 3,
                child: Image.asset('assets/logo/logo.png'),
              )),
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Text(
              'HEALTH-NET',
              style: Theme.of(context).textTheme.display2
            ),
          ),
          Center(
            child: Container(
                height: 400,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColorLight, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: MultiBlocProvider(providers: [
                  BlocProvider.value(
                      value: BlocProvider.of<AuthenticationBloc>(context)),
                  BlocProvider.value(
                      value: BlocProvider.of<LoadingDialogBloc>(context)),
                ], child: LoginForm())),
          ),
        ],)
    );
  }
}

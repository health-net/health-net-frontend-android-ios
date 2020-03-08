import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/bloc/error_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/bloc/loading_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login/assets/authentication/bloc/authentication_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/bloc/patient_sensors_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/bloc/patient_registration_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/bloc/patients_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/user_registration/bloc/user_registration_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/login_screen.dart';
import 'package:health_net_frontend_android_ios/presentation/patient_device_node_details_screen.dart';
import 'package:health_net_frontend_android_ios/presentation/patients_screen.dart';
import 'package:health_net_frontend_android_ios/presentation/themes/bloc/dynamic_theme_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/user_management_screen.dart';
import 'package:health_net_frontend_android_ios/presentation/user_registration_screen.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (BuildContext context) => LoadingDialogBloc()),
    BlocProvider(create: (BuildContext context) => DynamicThemeBloc()),
    BlocProvider(create: (BuildContext context) => AuthenticationBloc()),
    BlocProvider(create: (BuildContext context) => PatientSensorsBloc()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BlocProvider.of<DynamicThemeBloc>(context).state.actualTheme,
      initialRoute: '/authentication',
      routes: {
        '/authentication': (context) => MultiBlocProvider(providers: [
              BlocProvider.value(
                  value: BlocProvider.of<LoadingDialogBloc>(context)),
              BlocProvider.value(
                  value: BlocProvider.of<AuthenticationBloc>(context)),
              BlocProvider(create: (BuildContext context) => ErrorDialogBloc()),
            ], child: LoginScreen()),

        '/patients': (context) => MultiBlocProvider(providers: [
              BlocProvider(create: (BuildContext context) => PatientsBloc()),
              BlocProvider.value(
                  value: BlocProvider.of<LoadingDialogBloc>(context)),
              BlocProvider.value(
                  value: BlocProvider.of<AuthenticationBloc>(context)),
              BlocProvider.value(
                  value: BlocProvider.of<PatientSensorsBloc>(context)),
              BlocProvider(create: (BuildContext context) => UserRegistrationBloc()),
              BlocProvider(
                create: (BuildContext context) => ErrorDialogBloc(),
              ),
              BlocProvider(
                  create: (BuildContext context) =>
                      PatientRegistrationDialogBloc())
            ], child: PatientsScreen()),

        '/patient/device': (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(
                    value: BlocProvider.of<LoadingDialogBloc>(context)),
                BlocProvider.value(
                    value: BlocProvider.of<PatientSensorsBloc>(context)),
              ],
              child: PatientDeviceNodeScreen(),
            ),
        '/register': (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (BuildContext context) => ErrorDialogBloc()),
                BlocProvider(
                    create: (BuildContext context) => UserRegistrationBloc()),
                BlocProvider.value(
                    value: BlocProvider.of<LoadingDialogBloc>(context))
              ],
              child: UserRegistrationScreen(),
            ),
        '/users':(context)=> UserManagementScreen()
      },
    );
  }
}

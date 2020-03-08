import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/bloc/patient_registration_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/patient_registration/assets/patient_registration_failure.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/patient_registration/assets/patient_registration_form.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/patient_registration/assets/patient_registration_success.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/patient_registration/bloc/patient_registration_bloc.dart';
class PatientRegistrationElement extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      return Container(
        height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(32),
            border: Border.all(
          width: 3,
          color: Theme.of(context).primaryColorLight,
        )),
        child:BlocBuilder<PatientRegistrationBloc,PatientRegistrationState>(
        builder:(context, state){
          if(state is PatientRegistrationInitial)
          {
            return BlocProvider.value(
              value: BlocProvider.of<PatientRegistrationBloc>(context),
              child: PatientRegistrationForm(),
              );
          }
          if(state is PatientRegistrationFailed)
          {return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: BlocProvider.of<PatientRegistrationBloc>(context)),
              BlocProvider.value(value: BlocProvider.of<PatientRegistrationDialogBloc>(context))
            ], child: PatientRegistrationFailurePage(state.patientName, state.statusCode));
            /*return BlocProvider.value(
              value: BlocProvider.of<PatientRegistrationBloc>(context),
              child: PatientRegistrationFailurePage(state.patientName, state.statusCode));
          */
          }
          if(state is PatientRegistrationSuccess)
          {
            return BlocProvider.value(
              value:BlocProvider.of<PatientRegistrationDialogBloc>(context),
              child: PatientRegistrationSuccessPage());
          }
        },
      )
      );
      /*PatientRegistrationBloc patientRegistrationBloc = new PatientRegistrationBloc();
      return BlocBuilder<PatientRegistrationBloc, PatientRegistrationState>(
        bloc: patientRegistrationBloc,
        builder:(BuildContext patientRegistrationContext, patientRegistrationState){
          if(patientRegistrationState is PatientRegistrationInitial)
          {
            return BlocProvider(
              create: (BuildContext context)=> patientRegistrationBloc,
              child: PatientRegistrationForm(),
              );
          }

          if(patientRegistrationState is PatientRegistrationSuccess)
          {
            return BlocProvider(
              create: (BuildContext context)=> BlocProvider.of<MedicalRecordsBloc>(context),
              child: PatientRegistrationSuccessPage(),
              );
          }
          return Container(height:0.0, width:0.0);
        }
        );*/
  }
}


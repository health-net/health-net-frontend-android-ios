import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_component.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/assets/patient_registration_failure.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/assets/patient_registration_form.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/assets/patient_registration_success.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/bloc/patient_registration_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/bloc/medical_records_bloc.dart';

class PatientRegistrationPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      PatientRegistrationBloc patientRegistrationBloc = new PatientRegistrationBloc();
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
        }
        );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_component.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/assets/patient_registration_failure.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/assets/patient_registration_form.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/assets/patient_registration_success.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/bloc/patient_registration_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/bloc/medical_records_bloc.dart';

class PatientRegistrationMediator extends StatelessWidget{

  @override
  Widget build(BuildContext dialogContext) {
       return BlocProvider(
         create:(BuildContext context)=>BlocProvider.of<PatientRegistrationBloc>(dialogContext),
         child: _RFMediator());
  }



}
class _RFMediator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientRegistrationBloc, PatientRegistrationState>(
              bloc: PatientRegistrationBloc(),
              builder: (BuildContext prcontext, state){
                if(state is PatientRegistrationInitial)
                {
                  return PatientRegistrationForm();
                }

                if(state is PatientRegistrationSuccess)
                {
                  return PatientRegistrationSuccessPage();
                }

                if(state is PatientRegistrationFailed)
                {
                  return PatientRegistrationFailurePage(state.patientName);
                }

                if(state is RegistrationCompleted)
                {
                  BlocProvider.of<MedicalRecordsBloc>(context).add(PatientsFetchingRequired());
                  return LoadingElement();
                }
              },
    );
  }
}


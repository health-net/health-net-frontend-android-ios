import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_component.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login_form/assets/authentication/bloc/authentication_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/connection_error.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/medical_records_list.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_details/patient_detail_page.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/patient_registration_page.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/bloc/medical_records_bloc.dart';

class MedicalRecordsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    MedicalRecordsBloc medicalRecordsBLOC = new MedicalRecordsBloc();
    return BlocBuilder<MedicalRecordsBloc, MedicalRecordsState>(
      bloc:medicalRecordsBLOC,
      builder:(BuildContext buildingContext,MedicalRecordsState medicalRecordsState){
                if(medicalRecordsState is MedicalRecordsUninitialized)
                {
                  medicalRecordsBLOC.add(PatientsFetchingRequired());
                  return LoadingElement();
                }

                if(medicalRecordsState is MedicalRecordsInitialized)
                {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<AuthenticationBloc>(create: (BuildContext authContext)=> BlocProvider.of<AuthenticationBloc>(context)),
                      BlocProvider(create: (BuildContext mRContext)=> medicalRecordsBLOC)
                    ],
                    child: MedicalRecordsList(medicalRecordsState.patients));
                }

                if(medicalRecordsState is MedicalRecordsFetchingFailed)
                {
                     return BlocProvider<MedicalRecordsBloc>(
                          create:(BuildContext context) => medicalRecordsBLOC,
                          child: MedicalRecordsConnectionError(medicalRecordsState.statusCode),                
                  );
                }

                if(medicalRecordsState is PatientRegistration)
                {
                  return PatientRegistrationPage();
                }

                if(medicalRecordsState is PatientDetails)
                {
                  return PatientDetailPage();
                }
                
              }
      );
  }

}
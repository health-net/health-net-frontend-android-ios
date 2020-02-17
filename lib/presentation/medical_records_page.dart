import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_component.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/connection_error.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/bloc/patient_registration_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/patient_registration_page.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patients_sliverList.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/bloc/medical_records_bloc.dart';

class MedicalRecordsPage extends StatelessWidget{
  @override
  Widget build(BuildContext patientsContext) {
     MedicalRecordsBloc mrBloc = new MedicalRecordsBloc();
    return Container(
      decoration: BoxDecoration(
                gradient:LinearGradient(
                  colors: [Theme.of(patientsContext).scaffoldBackgroundColor, Theme.of(patientsContext).backgroundColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                  ),
              ),
      child: BlocProvider(
        create: (BuildContext context) =>mrBloc,
        child: MRPage(),
        ),
          );
        }
        
      }
      
      class MRPage extends StatelessWidget{
      @override
      Widget build(BuildContext context) {
        return BlocBuilder(
          bloc: BlocProvider.of<MedicalRecordsBloc>(context),
          builder:(BuildContext medicalRecordsContext, medicalRecordState){
            if(medicalRecordState is MedicalRecordsUninitialized)
            {
            BlocProvider.of<MedicalRecordsBloc>(context).add(PatientsFetchingRequired());
            }

            if(medicalRecordState is MedicalRecordsFetchingFailed)
            {
              return ConnectionError(medicalRecordState.statusCode);
            }

            if(medicalRecordState is MedicalRecordsInitialized)
            {
              return BlocProvider(
                create: (BuildContext mriContext)=>BlocProvider.of<MedicalRecordsBloc>(context),
                child:  PatientsSliverList(medicalRecordState.patients),
                );
             
            }

            if(medicalRecordState is PatientRegistrationPopupShowing)
            {
              return PatientRegistrationMediator();
            }
            return LoadingElement();
          }
          );
      }
            
    }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login_form/assets/authentication/bloc/authentication_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/bloc/patient_registration_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_sliverList_element.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/bloc/medical_records_bloc.dart';

class MedicalRecordsList extends StatelessWidget{
  final List<Patient> patients;

  const MedicalRecordsList(this.patients,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
          return CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      title: Text('Patients'),
                      centerTitle: true,

                      leading: IconButton(
                          icon: Icon(Icons.exit_to_app),
                          onPressed: () {
                            BlocProvider.of<AuthenticationBloc>(context).add(LogOutTentative());
                          }
                        ),

                      actions: <Widget>[
                        IconButton(
                        icon: Icon(Icons.person_add),
                        onPressed: () {
                            BlocProvider.of<MedicalRecordsBloc>(context).add(PatientRegistrationButtonPressed());
                        },)
                      ],
 
                      // Allows the user to reveal the app bar if they begin scrolling back
                      // up the list of items.
                      floating: true,

                      expandedHeight: 100,
                    ),

                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(title: Text(patients.elementAt(index).getFullName())),
                      childCount: patients.length,
                      ),
                    )

                  ],
                );

        }
      }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/bloc/patient_registration_bloc.dart';

class PatientRegistrationFailurePage extends StatelessWidget{
  final String patientName;

  const PatientRegistrationFailurePage(this.patientName,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:<Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.error,
              size: 50,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
            "An error occurred during registration operation",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25),
              ),
              onPressed:(){
                BlocProvider.of<PatientRegistrationBloc>(context).add(RetryButtonPressed(patientName));
              },
              child: Icon(
                Icons.refresh,
                size: 30,

              )
               ),
            )
        ]
      ),
    );
  }
  
}
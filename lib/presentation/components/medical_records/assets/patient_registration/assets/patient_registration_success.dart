import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/bloc/patient_registration_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/bloc/medical_records_bloc.dart';

class PatientRegistrationSuccessPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Center(
     child:Container(
        width: 300,
        height: 250,
            decoration: BoxDecoration(
                color: Colors.white,
                border:Border.all(
                          width: 3,
                          color:Theme.of(context).backgroundColor,
                       ),
                borderRadius: BorderRadius.all(Radius.circular(64))
            ),
      child: Column(
        children:<Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.cloud_done,
              size: 50,
              color: Theme.of(context).backgroundColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
            "Registration Completed",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).backgroundColor,
            ),
          ),
          ),
          Padding(
            padding: EdgeInsets.all(40),
            child: FlatButton(
              color: Theme.of(context).accentColor,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25),
              ),
              onPressed:(){
                BlocProvider.of<MedicalRecordsBloc>(context).add(PatientsFetchingRequired());
              },
              child: Icon(
                Icons.keyboard_backspace,
                size: 40,
                color: Colors.white,
              )
               ),
            )
        ]
      ),
     )
    );
  }
  }
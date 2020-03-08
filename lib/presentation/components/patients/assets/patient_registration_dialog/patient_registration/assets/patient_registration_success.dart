import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/bloc/patient_registration_dialog_bloc.dart';

class PatientRegistrationSuccessPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Center(
     child:Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
         IconButton(icon: Icon(Icons.close,size: 30,), onPressed:() => BlocProvider.of<PatientRegistrationDialogBloc>(context).hide()),
          Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.cloud_done,
              size: 60,
              color: Theme.of(context).accentColor
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
            "Registration Completed",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ),
        ]
      ),
    );
  }
  }
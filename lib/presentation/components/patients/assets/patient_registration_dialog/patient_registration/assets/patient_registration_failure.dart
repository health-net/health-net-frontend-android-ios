import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/bloc/patient_registration_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/patient_registration/bloc/patient_registration_bloc.dart';

class PatientRegistrationFailurePage extends StatelessWidget{
  final String patientName;
  final int statusCode;

  const PatientRegistrationFailurePage(this.patientName,this.statusCode,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.error,
              size: 50,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
            "Error: "+statusCode.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ),
                    Padding(
            padding: EdgeInsets.all(10),
            child: Text(
            "Patient registration failed",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                      color: Theme.of(context).accentColor,
                      padding: EdgeInsets.only(
                          top: 12, bottom: 12, left: 16, right: 16),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      onPressed: () {
                        BlocProvider.of<PatientRegistrationBloc>(context).add(RetryButtonPressed(patientName));
                      },
                      child: Text('Retry',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    FlatButton(
                      color: Theme.of(context).accentColor,
                      padding: EdgeInsets.only(
                          top: 12, bottom: 12, left: 16, right: 16),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      onPressed: () {
                        BlocProvider.of<PatientRegistrationDialogBloc>(context).hide();
                      },
                      child: Text('Close',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    )
              ],
               ),
            )
        ]
      ),
    );
  }
  
}
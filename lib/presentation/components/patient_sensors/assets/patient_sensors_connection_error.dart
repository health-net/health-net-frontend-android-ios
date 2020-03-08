import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/bloc/patients_bloc.dart';

class PatientSensorsConnectionError extends StatelessWidget{
  final int code;

  const PatientSensorsConnectionError(this.code,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
       return Container(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Icon(
              Icons.sentiment_dissatisfied,
              size: 50,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
            "Error "+code.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
            "An Error has occurred while tryng to reach the devices server",
            style: TextStyle(
              fontSize: 14,
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
                BlocProvider.of<PatientsBloc>(context).add(PatientsFetchingRequired());
              },
              child: Icon(
                Icons.refresh,
                size: 40,

              )
               ),
            )
        ]
      )
    );
  }
  
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_sensors/bloc/patient_sensors_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/bloc/medical_records_bloc.dart';

class PatientSliverListElement extends StatelessWidget{
  final Patient patient;

  const PatientSliverListElement(this.patient,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext sensorsContext)=>PatientSensorsBloc(),
      child: Padding(
        padding: EdgeInsets.all(10),
        child:FlatButton(
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
      color: Theme.of(context).backgroundColor,
      onPressed: (){/*TODO */},
      child: Row(
        children: <Widget>[
          Icon(
            Icons.person_pin,
            size: 50,
            color: Colors.white,
          ),
          Expanded(
            child: Text(
                    patient.getFullName(),
                    style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    ),
            )
        ],
      ),
      )
      )
      );
      }
  }
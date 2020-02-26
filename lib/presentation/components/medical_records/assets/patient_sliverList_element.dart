import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/bloc/medical_records_bloc.dart';

class PatientSliverListElement extends StatelessWidget{
  final Patient patient;

  const PatientSliverListElement(this.patient,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return null;
    }
  }
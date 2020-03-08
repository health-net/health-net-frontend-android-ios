import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/bloc/patient_registration_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/patient_registration/bloc/patient_registration_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';

class PatientRegistrationForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomRegFormSt();
}

class CustomRegFormSt extends State<PatientRegistrationForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _patientNameController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(icon: Icon(Icons.close,size: 30,), onPressed:() => BlocProvider.of<PatientRegistrationDialogBloc>(context).hide()),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(top: 40, left: 15, right: 15),
                  child: TextFormField(
                    controller: _patientNameController,
                    validator: (value) {
                      if (value.isEmpty) return "insert a name";
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Patient Name',
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.account_circle,
                          size: 30, color: Theme.of(context).backgroundColor),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                )),
                Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: FlatButton(
                      color: Theme.of(context).accentColor,
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 20, right: 20),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          BlocProvider.of<PatientRegistrationBloc>(context).add(
                              RegistrationButtonPressed(Patient(
                                  Uuid().v4(), _patientNameController.text)));
                        }
                      },
                      child: Text('Register',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ))
              ])),
    );
  }
}

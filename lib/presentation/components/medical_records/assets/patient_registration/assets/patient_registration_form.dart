import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/bloc/patient_registration_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/bloc/medical_records_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/rest_patients_handler.dart';

class PatientRegistrationForm extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => CustomRegFormSt();
 
  }
  
  class CustomRegFormSt extends State<PatientRegistrationForm>{
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController _patientNameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
        child:Container(
        width: 300,
        height: 200,
            decoration: BoxDecoration(
                border:Border.all(width: 3),
                borderRadius: BorderRadius.all(Radius.circular(16))     
            ),
      margin: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children:<Widget>[
                  Expanded(
                    child:Padding(
                      padding: EdgeInsets.only(top:35, left:10,right:10),
                      child:TextFormField( 
                        controller:_patientNameController,
                        validator: (value){
                          if(value.isEmpty)
                            return "insert a name";
                        },
                        decoration: InputDecoration(
              
                                labelText: 'Patient Name',
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.account_circle, size: 30, color:Theme.of(context).backgroundColor),
                                border: OutlineInputBorder(
                                            borderSide: BorderSide(color:Colors.white, width: 2),
                                            borderRadius: BorderRadius.circular(25),
                                        ),

                                ),
                        ),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FlatButton(
                      padding: EdgeInsets.only(top:15,bottom:15,left:20,right:20),
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                      onPressed:(){
                        if(!_formKey.currentState.validate())
                        {
                          return "Insert a valid name";
                        }
                        else BlocProvider.of<PatientRegistrationBloc>(context).add(RegistrationButtonPressed(Patient(Uuid().v4(),_patientNameController.text)));
                        return "";
                      },
                      child: Text('Register',style: TextStyle(fontSize: 20, color: Colors.white)),
                    )
                  )
          ]
        )
        ),
    ),
    );

  }
  }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_registration/bloc/patient_registration_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/assets/patient_sliverList_element.dart';
import 'package:health_net_frontend_android_ios/presentation/components/medical_records/bloc/medical_records_bloc.dart';

class PatientsSliverList extends StatelessWidget{
  final List<Patient> patients;

  const PatientsSliverList(this.patients,{Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(patients.length);
    List<Widget> _elements = new List<Widget>();

  patients.forEach((element) {_elements.add(
      BlocProvider(
              create: (BuildContext patientsContext)=>BlocProvider.of<MedicalRecordsBloc>(context),
              child: PatientSliverListElement(element),
            ));
    });
    print(_elements.length);
    return BlocProvider<MedicalRecordsBloc>(
          create: (BuildContext medicalRecordsContext)=>BlocProvider.of<MedicalRecordsBloc>(context),
          child: PatientScrollView(_elements));
  }
}
              
   class PatientScrollView extends StatelessWidget{
     final List<Widget> elements;

  const PatientScrollView(this.elements,{Key key}) : super(key: key);
      @override
      Widget build(BuildContext context) {
        return  CustomScrollView(

                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 200,
                    floating: false,
                    pinned: true,
                    actions: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<MedicalRecordsBloc>(context).add(PatientRegistrationButtonPressed());
                        },
                        child: Icon(
                                Icons.add_circle,
                                size: 30,
                                color: Theme.of(context).backgroundColor,
                              ),
                        )
                      )
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        "Patients",      
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    background: Image.asset("assets/splashArt.png", fit: BoxFit.cover),
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 100,
                    delegate:SliverChildListDelegate(elements), 
                  )
                  ],
                  
          );
        }
      }
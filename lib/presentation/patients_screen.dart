import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/bloc/error_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/error_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/bloc/loading_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/loading_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login/assets/authentication/bloc/authentication_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/bloc/patient_sensors_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_card.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/bloc/patient_registration_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/patient_registration_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/bloc/patients_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/user_registration/bloc/user_registration_bloc.dart';

class PatientsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PatientsBloc>(context).add(PatientsFetchingRequired());       
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<PatientsBloc, PatientsState>(
        condition: (previousState, state) {
          if (previousState is PatientsUninitializedState) {
            BlocProvider.of<LoadingDialogBloc>(context).hide();
            if (state is PatientsFetchingFailed) {
              if(state.statusCode==401){
                BlocProvider.of<AuthenticationBloc>(context).add(LogOutTentative());
                Navigator.of(context).pop();
                BlocProvider.of<PatientsBloc>(context).close();
                BlocProvider.of<PatientSensorsBloc>(context).close();
                BlocProvider.of<ErrorDialogBloc>(context).close();
                BlocProvider.of<PatientRegistrationDialogBloc>(context).close();
              }

              BlocProvider.of<ErrorDialogBloc>(context)
                  .show(Icons.error_outline, state.statusCode);
            }
          }
          return true;
        },
        listener: (context, state) {},
        child: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: MultiBlocProvider(providers: [
                  BlocProvider.value(
                      value: BlocProvider.of<ErrorDialogBloc>(context)),
                  BlocProvider.value(
                      value: BlocProvider.of<LoadingDialogBloc>(context)),
                  BlocProvider.value(
                      value: BlocProvider.of<PatientsBloc>(context)),
                  BlocProvider.value(
                      value: BlocProvider.of<PatientSensorsBloc>(context)),   
                  BlocProvider.value(
                      value: BlocProvider.of<PatientRegistrationDialogBloc>(context)),
                  BlocProvider.value(
                      value: BlocProvider.of<UserRegistrationBloc>(context))
                
                ], child: PatientsScreenElements())),
            BlocProvider.value(
                value: BlocProvider.of<LoadingDialogBloc>(context),
                child: LoadingDialog()),
            BlocProvider.value(
              value: BlocProvider.of<ErrorDialogBloc>(context),
              child: GenericErrorDialog(),
            ),
            BlocProvider.value(
              value: BlocProvider.of<PatientRegistrationDialogBloc>(context),
              child: PatientRegistrationDialog(),
            ),
           ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,size: 40,color:Colors.white),
        onPressed: (){
          BlocProvider.of<PatientRegistrationDialogBloc>(context).add(ShowPatientRegistration());
        }
        ),
    );
  }
}

class PatientsScreenElements extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<PatientSensorsBloc,PatientSensorsState>(
      listener:(context, state){
        if(state is PatientSensorsDeviceSelectedState)
        {
          Navigator.of(context).pushNamed('/patient/device');
        }
      },
      child: BlocBuilder<PatientsBloc,PatientsState>(
      builder:(context, state){
        if(state is PatientsInitializedState)
        {
          return CustomScrollView(
            slivers: <Widget>[
        SliverAppBar(
          title: Text('Patients'),
          centerTitle: true,
          

          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Center(
              child: Container(
                padding: EdgeInsets.all(30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                    Text("medical records count:"),
                    Text(
                      state.patients.length.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ])),
            ),
          ),

          leading: IconButton(
              icon: Icon(Icons.exit_to_app, size: 30,),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(LogOutTentative());
                Navigator.of(context).pop();
                BlocProvider.of<PatientsBloc>(context).close();
                BlocProvider.of<PatientSensorsBloc>(context).close();
                BlocProvider.of<ErrorDialogBloc>(context).close();
                BlocProvider.of<PatientRegistrationDialogBloc>(context).close();
              }),

          actions: <Widget>[
          IconButton(
             icon:Icon(Icons.person_add, size: 35),
             onPressed:(){
               Navigator.of(context).pushNamed('/register');
             },
          ),
          Padding(
            padding: EdgeInsets.only(left:10),
            child: IconButton(
            icon:Icon(Icons.list,size: 35), onPressed: (){
              Navigator.of(context).pushNamed('/users');
            }),
            )
        
          ],

          // Allows the user to reveal the app bar if they begin scrolling back
          // up the list of items.
          floating: true,
          pinned: true,
          
          expandedHeight: 150,
        ),
        SliverList(
          delegate:SliverChildBuilderDelegate(
            (context, index) => Padding(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: BlocProvider.value(
                  value: BlocProvider.of<PatientSensorsBloc>(context),
                  child:PatientCard(state.patients.elementAt(index)),
                  ),
          ),
          childCount: state.patients.length,
          ))
            ]
          );
        }

        return Container(height:0.0, width:0.0);
      }),);
    
    
  }
}

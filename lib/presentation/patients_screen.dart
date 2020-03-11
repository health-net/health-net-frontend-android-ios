import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/bloc/error_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/error_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/bloc/loading_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/loading_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login/assets/authentication/bloc/authentication_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/bloc/patient_registration_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/patient_registration_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/bloc/patients_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/patients_card_list.dart';
import 'package:health_net_frontend_android_ios/presentation/components/user_registration/bloc/user_registration_bloc.dart';

class PatientsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<PatientsBloc, PatientsState>(
        listener: (context, state) {
          if (state is PatientsFetchingFailed) {
            BlocProvider.of<LoadingDialogBloc>(context).hide();
            if (state.statusCode == 401) {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(LogOutTentative());
              Navigator.of(context).pop();
            }
          }
        },
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
                      value: BlocProvider.of<PatientRegistrationDialogBloc>(
                          context)),
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
          child: Icon(Icons.add, size: 40, color: Colors.white),
          onPressed: () {
            BlocProvider.of<PatientRegistrationDialogBloc>(context)
                .add(ShowPatientRegistration());
          }),
    );
  }
}

class PatientsScreenElements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LoadingDialogBloc>(context).show();
    return  BlocBuilder<PatientsBloc, PatientsState>(builder: (context, state) {
        if (state is PatientsInitializedState) {
          return CustomScrollView(slivers: <Widget>[
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ])),
                ),
              ),

              leading: IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    size: 30,
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(LogOutTentative());
                     Navigator.of(context).pop();
                  }),

              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.person_add, size: 35),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: IconButton(
                      icon: Icon(Icons.list, size: 35),
                      onPressed: () {
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
            BlocProvider.value(
            value: BlocProvider.of<LoadingDialogBloc>(context),
            child:PatientsCardList.fromPatients(state.patients))
          ]);
        }

        return Container(height: 0.0, width: 0.0);
      },
    );
  }
}

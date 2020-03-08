import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/bloc/patient_registration_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/patient_registration/bloc/patient_registration_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_registration_dialog/patient_registration/patient_registration_element.dart';

class PatientRegistrationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<PatientRegistrationDialogBloc,
            PatientRegistrationDialogState>(
        listener: (context, state) {
          if (state is PatientRegistrationDialogShowing) {
            WidgetsBinding.instance.addPostFrameCallback((duration) => {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      child: WillPopScope(
                          child: Dialog(
                            backgroundColor: Colors.transparent,
                            child: MultiBlocProvider(providers: [
                            BlocProvider.value(
                                value: BlocProvider.of<
                                    PatientRegistrationDialogBloc>(context)),
                            BlocProvider(
                                create: (BuildContext context) =>
                                    PatientRegistrationBloc()),
                          ], child: PatientRegistrationElement()),
                          ),
                          onWillPop: () async => false)),
                });
          }
          if (state is PatientRegistrationDialogHiding) {
            Navigator.pop(context);
          }
        },
        child: Container(
          height: 0.0,
          width: 0.0,
        ));
  }
}

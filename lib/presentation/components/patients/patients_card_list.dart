import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/bloc/loading_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/bloc/patient_sensors_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patients/assets/patient_card.dart';

class PatientsCardList extends StatelessWidget {
  final Map<Patient, PatientSensorsBloc> _patientSensorsBlocs;

  const PatientsCardList(this._patientSensorsBlocs, {Key key})
      : super(key: key);

  factory PatientsCardList.fromPatients(List<Patient> patients) {
    return PatientsCardList(Map<Patient, PatientSensorsBloc>.fromEntries(
        patients.map((patient) => MapEntry(patient, PatientSensorsBloc()))));
  }

  @override
  Widget build(BuildContext context) {
    _patientSensorsBlocs.entries.forEach((entry) =>
        entry.value.add(PatientSensorsFetchingRequiredEvent(entry.key)));

    //building patientsCard
    List<BlocProvider<PatientSensorsBloc>> widgetList =
        _patientSensorsBlocs.entries.map((entry) => BlocProvider.value(
              value: entry.value,
              child: PatientCard(entry.key),
            )).toList();

    //checking that all the patientCards have obtained their sensors
    return MultiBlocListener(
      listeners: List.from(
        _patientSensorsBlocs.entries.map(
            (entry) => BlocListener<PatientSensorsBloc, PatientSensorsState>(
                bloc: entry.value,
                listener: (entryContext, state) {
                  if (state is PatientSensorsInitializedState) {
                    if (_patientSensorsBlocs.entries.every((blocEntry) =>
                        blocEntry.value.state
                            is PatientSensorsInitializedState)) {
                      BlocProvider.of<LoadingDialogBloc>(context).hide();
                    }
                  }
                })),
      ),
      child: SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: widgetList.elementAt(index)),
        childCount: _patientSensorsBlocs.length,
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/assets/cards/patient_device_card.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/assets/patient_sensors_connection_error.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/bloc/patient_sensors_bloc.dart';

class PatientCard extends StatefulWidget {
  final Patient patient;

  const PatientCard(this.patient, {Key key}) : super(key: key);

  @override
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PatientSensorsBloc>(context)
        .add(PatientSensorsFetchingRequiredEvent(this.widget.patient));
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius:
                BorderRadius.all(Radius.circular((isExpanded) ? 8 : 16)),
            border:
                Border.all(color: Theme.of(context).dividerColor, width: 3)),
        child: ExpansionTile(
          title: Container(
              height: 80,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Icon(Icons.person_pin,
                          color: Theme.of(context).accentColor, size: 40),
                    ),
                    Text(
                      this.widget.patient.getFullName(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )),
          trailing: (isExpanded)
              ? Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).accentColor,
                  size: 32,
                )
              : Icon(
                  Icons.arrow_right,
                  color: Theme.of(context).disabledColor,
                  size: 32,
                ),
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          children: <Widget>[
            BlocBuilder<PatientSensorsBloc, PatientSensorsState>(
                builder: (context, state) {
              if (state is PatientSensorsFetchingFailed) {
                return Container(
                  height: 200,
                  child: PatientSensorsConnectionError(state.errorCode),
                );
              }
              if (state is PatientSensorsInitializedState) {
                if (state.devices.length == 0) {
                  return Container(
                      height: 100,
                      child: Center(
                        child: Text("No devices available for this user",
                            style:Theme.of(context).textTheme.body1
                      )));
                } else {
                  List<PatientDeviceCard> cards;
                  state.devices.forEach((element) {
                    cards.add(PatientDeviceCard(element,this.widget.patient));
                  });
                  return GridView.extent(
                    maxCrossAxisExtent: 250,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    children: cards,
                  );
                }
              }
            })
          ],
        ));
  }
}

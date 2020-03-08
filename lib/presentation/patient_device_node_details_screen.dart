import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/logic/rest/environment.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/bloc/loading_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/loading_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/assets/cards/patient_device_node_card.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/assets/cards/patient_device_node_property.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/bloc/patient_sensors_bloc.dart';
import 'package:web_socket_channel/io.dart';

class PatientDeviceNodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      BlocProvider.value(
          value: BlocProvider.of<LoadingDialogBloc>(context),
          child: LoadingDialog()),
      BlocBuilder<PatientSensorsBloc, PatientSensorsState>(
        builder: (context, state){
          if (state is PatientSensorsDeviceSelectedState) {
            return CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                title: Text("Device " +
                    state.deviceId +
                    "connected to " +
                    state.patient.getFullName()),
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Center(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Text("device nodes count:"),
                          Text(
                            state.deviceNodes.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ])),
                  ),
                ),

                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      BlocProvider.of<PatientSensorsBloc>(context).add(
                          PatientSensorsFetchingRequiredEvent(state.patient));
                      Navigator.pop(context);
                    }),

                // Allows the user to reveal the app bar if they begin scrolling back
                // up the list of items.
                floating: true,
                pinned: true,

                expandedHeight: 150,
              ),
              SliverGrid.extent(
                children: state.deviceNodes
                    .map(
                      (e) => MultiBlocProvider(
                          providers: [
                            BlocProvider.value(
                                value: BlocProvider.of<PatientSensorsBloc>(
                                    context)),
                          ],
                          child: PatientDeviceNodeCard(
                              e, state.deviceId, state.patient)),
                    )
                    .toList(),
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              )
            ]);
          }

          if (state is PatientSensorsDeviceNodeSelectedState) {
            return CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                title: Text("Device Node" +
                    state.deviceNodeId +
                    "of Device" +
                    state.deviceId),
                centerTitle: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Center(
                    child: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Text("device node properties count:"),
                          Text(
                            state.deviceNodeProperties.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )
                        ])),
                  ),
                ),

                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      BlocProvider.of<PatientSensorsBloc>(context).add(
                          PatientSensorsFetchingRequiredEvent(state.patient));
                      Navigator.pop(context);
                    }),

                // Allows the user to reveal the app bar if they begin scrolling back
                // up the list of items.
                floating: true,
                pinned: true,

                expandedHeight: 150,
              ),
              SliverList(
                delegate: SliverChildListDelegate(state.deviceNodeProperties
                    .map((e) => PatientDeviceNodePropertyCard(
                          e,
                          IOWebSocketChannel.connect(
                              "ws://" +
                                  Env.healthnet_ip +
                                  Env.healthnet_devices_if +
                                  "/" +
                                  state.deviceId +
                                  "/" +
                                  state.deviceNodeId +
                                  "/" +
                                  e.id,
                              headers: {
                                HttpHeaders.authorizationHeader:
                                    "Bearer " + state.authToken
                              }),
                          settableWsChannel: (e.settable)
                              ? null
                              : IOWebSocketChannel.connect(
                                  "ws://" +
                                      Env.healthnet_ip +
                                      Env.healthnet_devices_if +
                                      "/" +
                                      state.deviceId +
                                      "/" +
                                      state.deviceNodeId +
                                      "/" +
                                      e.id +
                                      "/set",
                                  headers: {
                                      HttpHeaders.authorizationHeader:
                                          "Bearer " + state.authToken
                                    }),
                        ))
                    .toList()),
              )
            ]);
          }
          return Container(height: 0.0,width:0.0);
        },
      )
    ]);
  }
}

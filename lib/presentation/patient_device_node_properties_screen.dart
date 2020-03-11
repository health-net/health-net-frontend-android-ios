import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/device_node.dart';
import 'package:health_net_frontend_android_ios/logic/rest/environment.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/assets/cards/patient_device_node_property.dart';
import 'package:web_socket_channel/io.dart';

class PatientDeviceNodePropertiesScreen extends StatefulWidget {
  @override
  State<PatientDeviceNodePropertiesScreen> createState() =>
      _PatientDeviceNodePropertiesScreenState();
}

class _PatientDeviceNodePropertiesScreenState
    extends State<PatientDeviceNodePropertiesScreen> {
  @override
  Widget build(BuildContext context) {
    final DeviceNodeArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          title: Text("properties of Device Node " +
              args.deviceNode.id +
              "\n of Device" +
              args.deviceId +
              "\nconnected to patient " +
              args.patient.getFullName()),
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
                      args.deviceNode.properties.length.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )
                  ])),
            ),
          ),

          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),

          // Allows the user to reveal the app bar if they begin scrolling back
          // up the list of items.
          floating: true,
          pinned: true,

          expandedHeight: 150,
        ),
        SliverGrid.extent(
          children: args.deviceNode.properties
              .map((e) => PatientDeviceNodePropertyCard(
                    e,
                    IOWebSocketChannel.connect(
                        "ws://" +
                            Env.healthnet_ip +
                            Env.healthnet_devices_if +
                            args.deviceId +
                            args.deviceNode.id +
                            e.id,
                        headers: {
                          HttpHeaders.authorizationHeader:
                              "Bearer " + args.authToken
                        }),
                    settableWsChannel: (e.settable)
                        ? IOWebSocketChannel.connect(
                            "ws://" +
                                Env.healthnet_ip +
                                Env.healthnet_devices_if +
                                args.deviceId +
                                args.deviceNode.id +
                                e.id +
                                "/set",
                            headers: {
                                HttpHeaders.authorizationHeader:
                                    "Bearer " + args.authToken
                              })
                        : null
                  ))
              .toList(),
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        )
      ]),
    );
  }
}

class DeviceNodeArgs {
  final Patient patient;
  final String deviceId;
  final DeviceNode deviceNode;
  final String authToken;

  DeviceNodeArgs(this.patient, this.deviceId, this.deviceNode, this.authToken);
}

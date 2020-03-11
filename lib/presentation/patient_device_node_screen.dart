import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/device.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/assets/cards/patient_device_node_card.dart';


class PatientDeviceNodesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DeviceArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                title: Text("Device " +
                    args.device.id +
                    "connected to " +
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
                            args.device.nodes.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
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
                children: args.device.nodes
                    .map(
                      (e) =>PatientDeviceNodeCard(e, args.device.id, args.patient, args.authTok)
                    )
                    .toList(),
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              )
      ]
      ),
      );
  }
}

class DeviceArgs{
final Patient patient;
final Device device;
final String authTok;

  DeviceArgs(this.patient, this.device, this.authTok);
}
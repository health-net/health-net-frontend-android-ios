import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/device_node.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/assets/cards/interface/patient_sensors_card_interface.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/bloc/patient_sensors_bloc.dart';

class PatientDeviceNodeCard extends PatientSensorsCardInterface{
  final Patient patient;
  final String deviceId;
  final DeviceNode deviceNode;
  final String authToken;

  PatientDeviceNodeCard(this.deviceNode, this.deviceId, this.patient, this.authToken);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new InkWell(
        onTap: (){
          Navigator.of(context).pushNamed('/patient/device/node');
        },

        child:
            Container(
              height: 200,
              child:Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget>[
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Icon(Icons.device_hub, size: 30,color: Theme.of(context).accentColor),
                    ),
                  Text(
                    deviceNode.name+":"+deviceNode.id,
                    style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                            "properties count : "+deviceNode.properties.length.toString(),
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                  )
                  ])
                  ),
                )
                )
      );
    }
  }
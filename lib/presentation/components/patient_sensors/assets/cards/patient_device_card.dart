import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/device.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
import 'package:health_net_frontend_android_ios/presentation/components/patient_sensors/assets/cards/interface/patient_sensors_card_interface.dart';
import 'package:health_net_frontend_android_ios/presentation/patient_device_node_properties_screen.dart';
import 'package:health_net_frontend_android_ios/presentation/patient_device_node_screen.dart';
class PatientDeviceCard extends PatientSensorsCardInterface{
  final Patient patient;
  final Device device;
  final String authToken;

  PatientDeviceCard(this.patient, this.device, this.authToken);


  @override
  Widget build(BuildContext context) {
    return Card(
      child: new InkWell(
        onTap: (){
         Navigator.of(context).pushNamed('/patient/device',arguments:DeviceArgs(patient,device,authToken));
        },

        child:
            Container(
              height: 150,
              child:Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget>[
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Icon(Icons.device_hub, size: 30,color: Theme.of(context).accentColor),
                    ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                            device.name+":"+device.id,
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                            "nodes count : "+device.nodes.length.toString(),
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

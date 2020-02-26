import 'dart:convert';
import 'package:http/http.dart'as http;

import 'device.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'package:health_net_frontend_android_ios/logic/rest/environment.dart';

class DevicesInformationHandler{
  final String _url = Env.healthnet_ip+":"+Env.healthnet_devices_port+Env.healthnet_devices_if;

  Future<List<Device>> getDevicesInformationByPatientID(String uuid) async{
     return await http.get(_url+"?patientId="+uuid).then(
          (http.Response response){
              if(response.statusCode<200||response.statusCode>=400)
                throw new RESTAPIConsumptionException(response.statusCode, _url, "GET");

              var devicesJson = jsonDecode(response.body) as List;
              return devicesJson.map((device) => Device.fromJSon(device)).toList();
          });
    } 
}
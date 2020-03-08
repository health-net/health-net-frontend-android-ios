import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'device.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'package:health_net_frontend_android_ios/logic/rest/environment.dart';

class DevicesInformationHandler {
  final String _url = "https://" + Env.healthnet_ip + Env.healthnet_devices_if;

  Future<List<Device>> getDevicesInformationByPatientID(
      String uuid, String authToken) async {
    return await http.get(_url + "?patientId=" + uuid, headers: {
      HttpHeaders.authorizationHeader: "Bearer " + authToken
    }).then((http.Response response) {
      if (response.statusCode < 200 || response.statusCode >= 400)
        throw new RESTAPIConsumptionException(response.statusCode, _url, "GET");

      var devicesJson = jsonDecode(response.body) as List;
      return devicesJson.map((device) => Device.fromJSon(device)).toList();
    });
  }
}

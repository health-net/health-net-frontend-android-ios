import 'dart:convert';
import 'dart:io';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'package:http/http.dart' as http;

import 'package:health_net_frontend_android_ios/logic/rest/environment.dart';

class UserHandler {
  Future<void> sendRegistrationRequest(
      String fullName, String email, String password, String authTok) async {
    final String url =
        "https://" + Env.healthnet_ip + Env.healthnet_registration_if;

    Map<String, String> credentials = {
      "password": password,
      "email": email,
      "fullName": fullName
    };

    await http.post(url, body: json.encode(credentials), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + authTok
    }).then((http.Response response) {
      if (response.statusCode < 200 ||
          response.statusCode >= 400 ||
          json == null) {
        print(json.encode(credentials));
        throw new RESTAPIConsumptionException(response.statusCode, url, "POST");
      }
    });
  }
}

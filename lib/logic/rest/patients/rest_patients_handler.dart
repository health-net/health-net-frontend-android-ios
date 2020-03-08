import 'dart:convert';
import 'dart:io';
import 'patient.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'interfaces/patient_handler_interface.dart';
import '../environment.dart';
import 'package:http/http.dart' as http;

///a REST API interaction class (Patient Micro-Service involved)
class PatientHandler implements PatientHandlerInterface {
  final String _url ="https://" + Env.healthnet_ip + Env.healthnet_patients_if;

  ///Asks for all patients' anagraphic details stored behind the patient microservice.
  ///
  ///Throws a [RESTAPIConsumptionException] if the http response doesn't contain the expected datas.
  @override
  Future<List<Patient>> getAllPatients(String authToken) async {
    return await http
        .get(_url, headers: {HttpHeaders.authorizationHeader: "Bearer "+authToken}).then(
            (http.Response response) {
      if (response.statusCode < 200 || response.statusCode >= 400)
        throw new RESTAPIConsumptionException(response.statusCode, _url, "GET");

      var patientsJson = jsonDecode(response.body) as List;
      return patientsJson.map((patient) => Patient.fromJSon(patient)).toList();
    });
  }

  ///Asks for a specific patient's anagraphic details stored behind the patient microservice.
  ///
  ///Throws a [RESTAPIConsumptionException] if the http response doesn't contain the expected datas.
  @override
  Future<Patient> getPatientById(String id, String authToken) async {
    String specificUrl = _url + "/" + id;
    return await http.get(specificUrl, headers: {
      HttpHeaders.authorizationHeader: authToken
    }).then((http.Response response) {
      if (response.statusCode < 200 || response.statusCode >= 400)
        throw new RESTAPIConsumptionException(
            response.statusCode, specificUrl, "GET");

      return Patient.fromJSon(jsonDecode(response.body));
    });
  }

  /// Asks the patient microservice to store a new patient's anagraphic details.
  ///Throws a [RESTAPIConsumptionException] if the http response doesn't contain the expected datas.
  @override
  Future<void> registerPatient(Patient myPatient, String authToken) async {
    await http.post(_url, body: myPatient.toJSon(), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer "+authToken
    }).then((http.Response response) {
      if (response.statusCode < 200 ||
          response.statusCode >= 400 ||
          json == null) {
        throw new RESTAPIConsumptionException(
            response.statusCode, _url, "POST");
      }
    });
  }
}

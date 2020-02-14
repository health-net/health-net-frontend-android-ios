import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'package:http/http.dart'as http;

import 'interfaces/rest_authentication_interface.dart';
import '../environment.dart';

class AuthenticationHandler implements  AuthenticationInterface{

///Asks the authentication microservice to provide a valid token for the given credentials.
///
///Throws a [RESTAPIConsumptionException] if the http response doesn't contain the expected datas. 
  @override 
  Future<String> sendAuthenticationRequest(String email, String password) async{
    final String url = Env.healthnet_ip+":"+Env.healthnet_auth_port+Env.healthnet_auth_if;

    Map<String,String> credentials = {"email":email,"password":password};
    
    return await http.post(url, body: json.encode(credentials), headers: {HttpHeaders.contentTypeHeader: "application/json"})
    .then((http.Response response) {
 
      if (response.statusCode < 200 || response.statusCode >= 400 || json == null) {
        print(json.encode(credentials));
        throw new RESTAPIConsumptionException(response.statusCode, url, "POST");
      }
      Map<String, dynamic> res=json.decode(response.body);

      return res['access_token'];
       });
    } 
  
  @override
  Future<bool> sendDeauthenticationRequest() {
    // TODO: implement sendDeauthenticationRequest
    throw UnimplementedError();
  }

  @override
  Future<bool> checkValidToken(String token) async{
       /*
       final String url =Env.healthnet_ip+":"+Env.healthnet_auth_token_port+Env.healthnet_auth_token_if;
        return await http.get(url).then(
          (http.Response response){
              if(response.statusCode<200||response.statusCode>=400)
                return false;
              return true;
          });
        */
        return false;
  }
  
}
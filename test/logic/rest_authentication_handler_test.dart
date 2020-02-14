import 'package:flutter_test/flutter_test.dart';
import 'package:health_net_frontend_android_ios/logic/rest/authentication/rest_authentication_handler.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
void main() {
  group("AuthenticationHandler unit tests", (){
    AuthenticationHandler restHandler = new AuthenticationHandler();
    test("testing sendAuthenticationRequest() with valid credentials", ()async{
      String result;
      try{
        result= await restHandler.sendAuthenticationRequest("test@test.com", "test1234%");

      }on RESTAPIConsumptionException catch(excep){
        print(excep.toString());
      }
      expect((result!=null&&result.isNotEmpty),true);
    });

    test("testing sendAuthenticationRequest() with unvalid credentials", ()async{
      try{
          await restHandler.sendAuthenticationRequest("your next line is...", "Learned your lesson, Primitive?");

      }on RESTAPIConsumptionException catch (e){
          expect(e.getStatusCode(), 401);
        }
    });
  });
}
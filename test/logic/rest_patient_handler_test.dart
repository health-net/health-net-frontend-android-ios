import 'package:flutter_test/flutter_test.dart';
import 'package:health_net_frontend_android_ios/logic/rest/exceptions/REST_API_consumption_exception.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/rest_patients_handler.dart';
import 'package:health_net_frontend_android_ios/logic/rest/patients/patient.dart';
void main() {
  group("PatientHandler unit tests",() {
    PatientHandler resthandler = new PatientHandler();
    List<Patient> rest;
      test('testing getAllPatients() method', () async{
        try{
          rest=await resthandler.getAllPatients();
          //rest.forEach((patient) {print(patient.toJSon());});
        } on RESTAPIConsumptionException catch (e){
          print(e.toString());
        }

        bool result=(rest.length>0);

        expect(result, true);

      });

      test('testing getPatientById() method', () async{
        Patient match = new Patient("34e5bb48-91af-4bc7-b9ad-9f7db4f14953", "test");
        Patient rest;
        try{
          rest=await resthandler.getPatientById(match.getId());
          //print(rest.toJSon());
        } on RESTAPIConsumptionException catch (e){
          print(e.toString());
        }
        bool result = (rest==match);

        expect(result, true);
      });

      test('testing registerPatient() method', () async{
        Patient match = new Patient("34e5bb48-91af-4bc7-b9ad-9f7db4f14953", "test");
        
        try{
          await resthandler.registerPatient(match);
        } on RESTAPIConsumptionException catch (e){
          expect(e.getStatusCode(), 409);
        }
      });
  });
}
import '../patient.dart';
abstract class PatientHandlerInterface{
  Future<Patient> getPatientById(String id, String authToken);
  Future<List<Patient>> getAllPatients(String authToken);
  Future<void> registerPatient(Patient myPatient,String authToken);


}
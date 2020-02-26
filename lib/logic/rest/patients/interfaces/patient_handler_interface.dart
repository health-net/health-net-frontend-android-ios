import '../patient.dart';
abstract class PatientHandlerInterface{
  Future<Patient> getPatientById(String id);
  Future<List<Patient>> getAllPatients();
  Future<void> registerPatient(Patient myPatient);


}
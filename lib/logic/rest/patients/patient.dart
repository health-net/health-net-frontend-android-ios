import 'interfaces/patient_interface.dart';
import 'package:equatable/equatable.dart';

class Patient extends Equatable implements PatientInterface {
  final String _id;
  final String _fullName;

  Patient(this._id, this._fullName);


  factory Patient.fromJSon(dynamic json) =>
    Patient(json['id'] as String, json['fullName'] as String);
  
  @override
  String getFullName() {
    return _fullName;
  }

  @override
  String getId() {
    return _id;
  }

  @override
  String toJSon() {
    return "{\n\"id\":\""+this._id+"\","+
            "\n\"fullName\":\""+this._fullName+"\""+
            "\n}";
  }

  @override
  List<Object> get props =>[this._id,this._fullName];
}
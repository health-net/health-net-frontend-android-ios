import 'package:equatable/equatable.dart';

class DeviceNodeProperty extends Equatable{
   final String id;
   final String name;
   final String datatype;
   final bool settable;
   final bool retained;
   final String unit;

  DeviceNodeProperty(this.id, this.name, this.datatype, this.settable, this.retained, this.unit);

   factory DeviceNodeProperty.fromJSon(dynamic json) =>
      DeviceNodeProperty(
        json['id'] as String,
        json['name'] as String,
        json['datatype'] as String,
        json['settable'] as bool,
        json['retained'] as bool,
        json['unit'] as String
        );

  @override
  List<Object> get props =>[id, name, datatype,retained, settable, unit];

}
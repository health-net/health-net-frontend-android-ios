import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/device_node.dart';

class Device extends Equatable{
  final String id;
  final String homie;
  final String name;
  final String state;
  final List<DeviceNode> nodes;

  Device(this.id, this.homie, this.name, this.state, this.nodes);

    factory Device.fromJSon(dynamic json) =>
      Device(
        json['id'] as String,
        json['homie'] as String,
        json['name'] as String,
        json['state'] as String,
        (jsonDecode(json['nodes']) as List).map((element) => DeviceNode.fromJSon(element)).toList()
        );

  @override
  List<Object> get props =>[id, homie, name, state];
}
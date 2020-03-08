//import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/logic/rest/devices/device_node_property.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PatientDeviceNodePropertyCard extends StatefulWidget {
  final DeviceNodeProperty property;
  final WebSocketChannel wsChannel;
  final WebSocketChannel settableWsChannel;
  const PatientDeviceNodePropertyCard(this.property, this.wsChannel, {Key key, this.settableWsChannel})
      : super(key: key);

  State<PatientDeviceNodePropertyCard> createState() => _NodePropertyState();
}

class _NodePropertyState extends State<PatientDeviceNodePropertyCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double actualvalue=0;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(this.widget.property.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Padding(
              padding: EdgeInsets.all(10),
              child: StreamBuilder(
                  stream: widget.wsChannel.stream,
                  builder: (context, snapshot) {
                    actualvalue=snapshot.data;
                    return Text(
                      snapshot.hasData ? '${snapshot.data}' : "-",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    );
                  })),
          (this.widget.settableWsChannel!=null)?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(icon: Icon(Icons.remove_circle,color:Theme.of(context).accentColor),
                onPressed:(){
                  this.widget.settableWsChannel.sink.add((actualvalue-1).toString());
                }),
                IconButton(icon: Icon(Icons.add_circle,color:Theme.of(context).accentColor),
                onPressed:(){
                  this.widget.settableWsChannel.sink.add((actualvalue+1).toString());
                })
            ],):Container(height:0.0,width:0.0)
        ],
      ),
      decoration: BoxDecoration(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('HEALTH-NET'),

                FlatButton(
                  child: Text('LOGOUT'),
                  color: Colors.grey
                  ,
                   onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                   }
                ),
              ],
            ),
            pinned: true,
            backgroundColor: Colors.blue[900],
            expandedHeight: 200.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
                //background: Image.asset('assets/forest.jpg', fit: BoxFit.cover),
                ),
          ),
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(Radius.circular(40)),
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(Radius.circular(40)),
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(Radius.circular(40)),
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(Radius.circular(40)),
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Container(
                      decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(Radius.circular(40)),
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  /* onPressed: () {
           BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut()) ;*/
}

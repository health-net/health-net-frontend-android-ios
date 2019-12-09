import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/authentication/authentication.dart';
import 'package:health_net_frontend_android_ios/repository/login_repository.dart';
import '../login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLoginPage extends StatelessWidget {

  final UserRepository userRepository;

  MyLoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  Widget build(BuildContext context) {
    return new Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          loginRepo: userRepository
          
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.blue[900],
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 80, bottom: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.width / 3,
                    child: Image.asset('assets/logo/logo.png'),
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Text(
                  'HEALTH-NET',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Center(
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: const [
                      BoxShadow(blurRadius: 40, color: Colors.black),
                    ],
                  ),
                  child: LoginForm(),
                ),
              ),
            ],
          )
          )
          ),
      )
    );
  }
}
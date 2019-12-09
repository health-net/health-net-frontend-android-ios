import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginFailure) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('${state.error}'),
          ),
        );
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 30, bottom: 40, left: 20, right: 20),
          child: Form(
              child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
                //autovalidate: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'il campo username non può essere vuoto';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'username',
                  prefixIcon: Icon(Icons.account_circle, size: 30),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password',
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 40,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: FlatButton(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
                  splashColor: Colors.cyan,
                  color: Colors.cyan,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0)),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed:
                      state is! LoginLoading ? _onLoginButtonPressed : null
                      
                ),
              )
            ],
          )),
        );
      },
    ));
  }
}

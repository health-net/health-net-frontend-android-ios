import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/bloc/error_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/error_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/bloc/loading_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/loading_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/user_registration/bloc/user_registration_bloc.dart';

class UserRegistrationForm extends StatefulWidget {
  @override
  State<UserRegistrationForm> createState() => _UserRegistrationFormState();
}

class _UserRegistrationFormState extends State<UserRegistrationForm> {
  var _emailController = TextEditingController();
  var _fullNameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: _fullNameController,
              validator: (value) {
                if (value.isEmpty) return "insert your full name";
                return null;
              },
              decoration: InputDecoration(
                labelText: 'full name',
                prefixIcon: Icon(Icons.accessibility_new, size: 30),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  //RFC2822 Validation
                  String mailRegEx =
                      "[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
                  if (!RegExp(mailRegEx).hasMatch(value)) {
                    return 'insert a valid email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'email',
                  prefixIcon: Icon(Icons.account_circle, size: 30),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) return 'insert a password';
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'password',
                  prefixIcon: Icon(Icons.lock, size: 30),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 30),
            child: FlatButton(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 50, right: 50),
                splashColor: Colors.cyan,
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0)),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    BlocProvider.of<LoadingDialogBloc>(context).show();
                    BlocProvider.of<UserRegistrationBloc>(context).add(
                        UserRegistrationButtonPressed(_fullNameController.text,
                            _emailController.text, _passwordController.text));
                  }
                }),
          )
        ],
      ),
    ));
  }
}

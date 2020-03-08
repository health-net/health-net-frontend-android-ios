import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_dialog/bloc/loading_dialog_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login/assets/authentication/bloc/authentication_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => __LoginFormState();
}

class __LoginFormState extends State<LoginForm> {
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _rememberMe = false;
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationUnauthenticated) {
            if (!["", null].contains(state.storedEmail)) {
              _emailController.text = state.storedEmail;
              _rememberMe = true;
            }
          }
        },
        child: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
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
                      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: CheckboxListTile(
                          activeColor: Theme.of(context).accentColor,
                          title: Text("remember me"),
                          value: _rememberMe,
                          onChanged: (bool newValue) {
                            setState(() {
                              _rememberMe = newValue;
                            });
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 25),
                      child: FlatButton(
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 50, right: 50),
                          splashColor: Colors.cyan,
                          color: Theme.of(context).accentColor,
                          textColor: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              BlocProvider.of<LoadingDialogBloc>(context)
                                  .show();
                              BlocProvider.of<AuthenticationBloc>(context).add(
                                  LoginTentative(_emailController.text,
                                      _passwordController.text, _rememberMe));
                            }
                          }),
                    )
                  ],
                ))));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login_form/bloc/custom_loginform_bloc.dart';

///must be child of a [BlocProvider<AuthenticationBloc>].
///
///Handles login UI listening to state changes.
class CustomLoginForm extends StatefulWidget{
  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

 class _CustomLoginFormState extends State<CustomLoginForm>{
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext formContext) {
   return Center(
            child:Form(
            key: _formKey,
            child:Column(
                      children: <Widget>[
                        Expanded(
                          child:Padding(
                                  padding: EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
                                  child:TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        controller: _emailController,
                                        validator: (value) {
                                          //RFC2822 Validation
                                          String mailRegEx = "[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
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
                          child:Padding(
                                  padding: EdgeInsets.only(top: 30, bottom: 10, left: 20, right: 20),
                                  child: TextFormField(
                                          controller: _passwordController,
                                          obscureText: true,
                                          validator: (value){
                                            if(value.isEmpty)
                                              return 'insert a password';
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                                        labelText: 'password',
                                                        prefixIcon: Icon(Icons.lock,size: 30),
                                                        border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(25),
                                                                    ),
                                                      ),
                                                ),
                                      ),
                        ),
                            Padding(
                                    padding: EdgeInsets.only(top: 10,bottom: 25),
                                    child: FlatButton(
                                              padding:EdgeInsets.only(top: 15, bottom: 15, left: 50, right: 50),
                                              splashColor: Colors.cyan,
                                              color: Theme.of(context).accentColor,
                                              textColor: Colors.white,
                                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0)),
                                              child: Text('LOGIN',style: TextStyle(fontSize: 20),),
                                              onPressed:(){
                                                if(_formKey.currentState.validate()){
                                                    BlocProvider.of<CustomLoginFormBloc>(formContext).add(new LoginButtonPressed(_emailController.text,_passwordController.text));
                                                  }
                                                  }   
                                        ),
                                      )
                                ],
                                )
                    )
            );
    }
  }
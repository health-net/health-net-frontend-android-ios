import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_component.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login_form/assets/authentication/bloc/authentication_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login_form/assets/custom_LoginForm.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login_form/bloc/custom_loginform_bloc.dart';
class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext pageContext) {
    CustomLoginFormBloc loginFormBloc = new CustomLoginFormBloc();
    return Container(
              decoration: BoxDecoration(
                gradient:LinearGradient(
                  colors: [Theme.of(pageContext).backgroundColor, Colors.blue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                  ),
              ),
              child:BlocBuilder<CustomLoginFormBloc, CustomLoginformState>(
                bloc: loginFormBloc,
                builder: (BuildContext loginContext, loginState){
                  if(loginState is CustomLoginformInitial)
                    {
                      return SingleChildScrollView(
                          child: Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 80, bottom: 20),
                                child: Container(
                                  width: MediaQuery.of(pageContext).size.width / 1.5,
                                  height: MediaQuery.of(pageContext).size.width / 3,
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
                                height: 360,
                                width: 350,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                  boxShadow: const [
                                    BoxShadow(blurRadius: 40, color: Colors.black),
                                  ],
                                ),
                                child:  BlocProvider<CustomLoginFormBloc>(
                                          create: (BuildContext context) => loginFormBloc,
                                          child: CustomLoginForm(),
                                          ),
                                        
                              ),
                            ),
                            
                          ],
                        )
                      );
                    }
                if(loginState is CustomLoginLoading)
                  {
                    BlocProvider.of<AuthenticationBloc>(pageContext).add(LoginTentative(loginState.email,loginState.password));
                    return LoadingElement();
                  }
                 
                return Container(height:0.0,width:0.0);

                }
              )
        );
      }

}

/*

 */
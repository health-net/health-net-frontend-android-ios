import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_popup_dialog.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/loading_component.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login_form/assets/authentication/bloc/authentication_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/login_page.dart';
import 'package:health_net_frontend_android_ios/presentation/themes/bloc/dynamic_theme_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc()..add(AppStarted());
      },
      child:App()
      ),
  );
  
}

 class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
    );
    return MultiBlocProvider(providers: [
      BlocProvider<DynamicThemeBloc>(
        create: (BuildContext context)=>DynamicThemeBloc(),
      ),
      BlocProvider<AuthenticationBloc>(
        create: (BuildContext context)=>AuthenticationBloc(),
      )
    ],
    child: ThemeHandler());
  }
  }

  class ThemeHandler extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
     return BlocBuilder<DynamicThemeBloc,DynamicThemeState>(
      bloc: BlocProvider.of<DynamicThemeBloc>(context),
      builder: (BuildContext themeContext, themeState) {
                print(themeState.toString());
                 return MaterialApp(
                        theme: themeState.actualTheme,
                        home: Page(context), 
                    );
                  }
                  );
            }
    }

class Page extends StatelessWidget{
  final BuildContext authContext;

  const Page(this.authContext,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext themeContext) {
    return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: MediaQuery.of(themeContext).size.width,
                height: MediaQuery.of(themeContext).size.height,
                child:BlocBuilder<AuthenticationBloc,AuthenticationState>(
                    bloc: BlocProvider.of<AuthenticationBloc>(themeContext),
                    builder: (BuildContext authContext, authState){
                        if(authState is AuthenticationUnauthenticated)
                          {
                            return LoginPage(); 
                          }
                        if(authState is AuthenticationAuthenticated)
                          {
                            return Text("Farfetch'd");
                          }
                        if(authState is AuthenticationUninitialized)
                          {
                          BlocProvider.of<AuthenticationBloc>(themeContext).add(AppStarted());
                          return LoadingElement();
                          }
                        if(authState is AuthenticationFailed)
                          {
                            Future.delayed(Duration.zero, (){
                            showDialog(
                                context: themeContext,
                                builder: (BuildContext dialogContext) =>CustomErrorDialog(authState.statusCode)
                              );
                            });
                            BlocProvider.of<AuthenticationBloc>(authContext).add(LoginTentativeFailed());
                            return LoadingElement();
                          }
                      },
                  )
      )
    );
  }
  
} 
  
import 'package:flutter/material.dart';
import 'package:health_net_frontend_android_ios/common/splash_screen.dart';
import 'package:health_net_frontend_android_ios/home_page/home_page.dart';
import 'package:health_net_frontend_android_ios/medical_records/medical_records_page.dart';
import 'package:health_net_frontend_android_ios/repository/login_repository.dart';
import 'authentication/authentication.dart';
import 'login/login.dart';
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
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(authRepo: userRepository)
          ..add(AppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
  
}

 class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationLoading) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return MyHomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return MyLoginPage(userRepository: userRepository);
          }
        },
      ),
    );
  }
}
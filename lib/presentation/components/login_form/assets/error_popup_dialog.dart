import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/login_form/assets/authentication/bloc/authentication_bloc.dart';

class CustomErrorDialog extends StatelessWidget{
  final int statusCode;
  const CustomErrorDialog(this.statusCode, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
                    child:dialogContent(context, statusCode),
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                                  color: Colors.orange,
                                  border: Border.all(
                                            width: 3,
                                            color: Colors.white,
                                          ),
                                  borderRadius: BorderRadius.all(Radius.circular(64))
                                ),
                  ),
    );
  }

  String _errorStringEvaluation(int code)
    {
      switch(code)
      {
        case 103: return "Connection Timed Out"; break;
        case 110: return "Destination Unreachable"; break;
        case 111: return "Check your Internet connection"; break; 
        case 113: return "Connection Refused"; break;
        case 401: return "invalid credentials"; break;
        case 500: return "internal server error"; break;
        default : return ""; break;
      }
    }

  dialogContent(BuildContext context, int code) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top:20, bottom: 5),
          child:Icon(
              Icons.error_outline,
              size: 80,
              color: Colors.white,
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top:20, bottom:5),
          child: Text(
                "Error "+code.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
                )
              ),
        ),
        Padding(
          padding: EdgeInsets.only(top:5, bottom:25),
          child:Text(
                _errorStringEvaluation(code),
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white
                ),
          ),
        ),
        FlatButton(
                  padding:EdgeInsets.all(15),
                  color: Colors.white,
                  textColor: Colors.orange,
                  shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0)),
                  child: Text('Retry',style: TextStyle(fontSize: 16),),
                  onPressed:(){
                    BlocProvider.of<AuthenticationBloc>(context).add(AppStarted());
                    Navigator.of(context).pop();                      
                  }
                  ),
      ],
    );
  }
  
}


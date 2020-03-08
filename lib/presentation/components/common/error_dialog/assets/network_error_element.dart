import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_net_frontend_android_ios/presentation/components/common/error_dialog/bloc/error_dialog_bloc.dart';

class NetworkErrorElement extends StatelessWidget {
  final IconData titleIcon;
  final int errorCode;

  final Map<int, String> _errorCodes = {
    103: "Connection Timed Out",
    110: "Destination Unreachable",
    111: "Check your Internet connection",
    113: "Connection Refused",
    400: "Bad Request",
    401: "invalid credentials",
    500: "internal server error",
  };

  NetworkErrorElement(this.titleIcon, this.errorCode, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(32),
            border: Border.all(
          width: 3,
          color: Theme.of(context).primaryColorLight,
        )),
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5),
            child: Icon(
              titleIcon,
              size: 80,
              color: Theme.of(context).accentColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 5),
            child: Text("Error " + errorCode.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).textTheme.bodyText2.color)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 25),
            child: Text(
              _errorCodes[errorCode],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyText2.color),
            ),
          ),
          FlatButton(
              padding: EdgeInsets.all(15),
              color: Theme.of(context).accentColor,
              textColor: Theme.of(context).textTheme.bodyText2.color,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25.0)),
              child: Text(
                'Retry',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                BlocProvider.of<ErrorDialogBloc>(context).hide();
              }),
        ]));
  }
}

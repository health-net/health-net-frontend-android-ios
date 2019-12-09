import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 5,
            ),
          ),
        ),
      ),
    );
  }
}

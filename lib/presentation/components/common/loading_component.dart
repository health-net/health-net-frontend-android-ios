import 'package:flutter/material.dart';

class LoadingElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 5,
            ),
          ),
      );
  }
}

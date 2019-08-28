import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class ToastController {
  static void show({
    BuildContext context,
    String message,
    Duration duration,
  }) {
    Flushbar(
      message: message,
      duration: duration,
      animationDuration: Duration(milliseconds: 300),
      //leftBarIndicatorColor: Colors.blue[300],
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.white,
      ),
      backgroundGradient: LinearGradient(
        colors: [Theme.of(context).primaryColor, Colors.teal],
      ),
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(
          color: Colors.blue[800],
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        )
      ],
    )..show(context);
  }
}

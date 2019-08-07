import 'package:flutter/material.dart';

class ThemePrimary {
  static theme() {
    return ThemeData(primaryColor: Colors.blue, backgroundColor: Colors.white);
  }

  static TextStyle loginPageButton(BuildContext context) {
    return TextStyle(color: Theme.of(context).primaryColor, fontSize: 15);
  }
}

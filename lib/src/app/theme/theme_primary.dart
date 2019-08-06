import 'package:flutter/material.dart';

class ThemePrimary {
  static theme() {
    return ThemeData(primaryColor: Colors.black);
  }

  static TextStyle loginPageButton(BuildContext context) {
    return TextStyle(color: Theme.of(context).primaryColor, fontSize: 15);
  }
}

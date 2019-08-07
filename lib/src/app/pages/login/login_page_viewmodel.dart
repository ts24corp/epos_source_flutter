import 'dart:async';

import 'package:epos_source_flutter/src/app/helper/validator.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_history_page.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_check_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPageViewModel extends ChangeNotifier {
  // final _emailSub = BehaviorSubject<String>();
  // final _passSub = BehaviorSubject<String>();
  // final _btnSignInSub = BehaviorSubject<bool>();

  // Stream<String> get emailStream => _emailSub.stream;
  // Stream<String> get passStream => _passSub.stream;
  // Stream<bool> get btnSignInStream => _btnSignInSub.stream;

  // StreamController<bool> _showPassController = new StreamController();
  // Stream get showPassStream => _showPassController.stream;
  LoginPageViewModel() {
    _emailController.addListener(() {
      if (_emailController.text.length > 1) isValidEmail();
    });
    _passController.addListener(() {
      if (_passController.text.length > 1) isValidInfo();
    });
  }
  BuildContext context;
  StreamController _loginController = new StreamController();
  Stream get loginStream => _loginController.stream;
  bool _showPass = false;
  get showPass => _showPass;

  TextEditingController _emailController = new TextEditingController();
  get emailController => _emailController;
  TextEditingController _passController = new TextEditingController();
  get passController => _passController;

  String _errorEmail;
  get errorEmail => _errorEmail;

  String _errorPass;
  get errorPass => _errorPass;

  void dispose() {
    print("dispose");
    // _emailSub.close();
    // _passSub.close();
    // _btnSignInSub.close();
    super.dispose();
    _loginController.close();
  }

  void onTapShowPassword() {
    _showPass = !_showPass;
    _loginController.sink.add(_showPass);
  }

  bool isValidEmail() {
    _errorEmail = null;
    var resultemail = Validator.validateEmail(_emailController.text);
    if (resultemail != null) {
      _errorEmail = resultemail;
      _loginController.sink.addError(false);
      return false;
    } else
      _loginController.sink.add(true);
    return true;
  }

  bool isValidPass() {
    _errorPass = null;
    var resultpass = Validator.validatePassword(_passController.text);
    if (resultpass != null) {
      _errorPass = resultpass;
      _loginController.sink.addError(false);
      return false;
    } else
      _loginController.sink.add(true);
    return true;
  }

  bool isValidInfo() {
    if (isValidEmail() && isValidPass()) {
      _loginController.sink.add(true);
      return true;
    }
    return false;
  }

  onSignInClicked() {
    if (isValidInfo())
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => TabsCheckPage(
      //             routeChildName: CheckTicketHistoryPage.routeName)));
      Navigator.pushNamed(context, TabsCheckPage.routeName,
          arguments: TabsCheckArgurment(
              routeChildName: CheckTicketHistoryPage.routeName));
  }
}
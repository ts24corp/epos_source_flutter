import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LoginPageViewModel {
  final _emailSub = BehaviorSubject<String>();
  final _passSub = BehaviorSubject<String>();
  final _btnSignInSub = BehaviorSubject<bool>();

  Stream<String> get emailStream => _emailSub.stream;
  Stream<String> get passStream => _passSub.stream;
  Stream<bool> get btnSignInStream => _btnSignInSub.stream;

  StreamController<bool> _showPassController = new StreamController();
  Stream get showPassStream => _showPassController.stream;
  // LoginViewModel() {
  //   Observable.combineLatest2(_emailSub, _passSub, () {});
  // }
  bool _showPass = false;
  get showPass => _showPass;
  set showPass(value) {
    _showPass = value;
  }

  void dispose() {
    print("dispose");
    _emailSub.close();
    _passSub.close();
    _btnSignInSub.close();
    _showPassController.close();
  }

  void onTapShowPassword() {
    showPass = !showPass;
    _showPassController.sink.add(_showPass);
  }
//   StreamController _userController = new StreamController();

//   Stream get userController => _userController.stream;

// void disposes(){
//   _userController.close();
// }
}

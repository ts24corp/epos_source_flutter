import 'dart:collection';

import 'package:epos_source_flutter/src/app/pages/login/login_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/theme/theme_primary.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   return null;
  // }
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  LoginPageViewModel loginPageViewModel = new LoginPageViewModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            constraints: BoxConstraints.expand(),
            color: Colors.white,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  SizedBox(
                    height: 140,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: Container(
                        width: 70,
                        height: 70,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                        child: FlutterLogo()),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                    child: Text('EPOS\nChào mừng bạn',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 30)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: TextFormField(
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                          labelText: "EMAIL",
                          labelStyle: ThemePrimary.loginPageButton(context)),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  StreamBuilder<Object>(
                      stream: loginPageViewModel.showPassStream,
                      builder: (context, snapshot) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                          child: Stack(
                              alignment: AlignmentDirectional.centerEnd,
                              children: <Widget>[
                                TextFormField(
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  obscureText: loginPageViewModel.showPass
                                      ? true
                                      : false,
                                  decoration: InputDecoration(
                                      labelText: "PASSWORD",
                                      labelStyle: ThemePrimary.loginPageButton(
                                          context)),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                ),
                                GestureDetector(
                                  onTap: loginPageViewModel.onTapShowPassword,
                                  child: Text(
                                    loginPageViewModel.showPass
                                        ? "HIDE"
                                        : "SHOW",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ]),
                        );
                      }),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        onPressed: loginPageViewModel.onTapShowPassword,
                        child: Text(
                          "Sign in",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  )
                ]))));
  }

  void onSignInClicked() {
    print("clicked");
  }

  // void onTapShowPass() {
  //   setState(() {
  //     _showPass = !_showPass;
  //   });
  // }
}

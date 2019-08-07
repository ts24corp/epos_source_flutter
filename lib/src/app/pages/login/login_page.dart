import 'dart:collection';

import 'package:epos_source_flutter/src/app/pages/login/login_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/theme/theme_primary.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ChangeNotifierProvider(
        child: LoginBodyWidget(),
        builder: (context) => LoginPageViewModel(),
      ),
    );
  }
}

class LoginBodyWidget extends StatefulWidget {
  @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   return null;
  // }
  _LoginBodyWidgetPageState createState() => _LoginBodyWidgetPageState();
}

class _LoginBodyWidgetPageState extends State<LoginBodyWidget> {
  final focus = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var loginPageViewModel = Provider.of<LoginPageViewModel>(context);
    loginPageViewModel.context = context;
    return StreamBuilder<Object>(
      stream: loginPageViewModel.loginStream,
      builder: (context, snapshot) {
        return SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            //color: Colors.white,
            //constraints: BoxConstraints.expand(),
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                    controller: loginPageViewModel.emailController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "EMAIL",
                        errorText: loginPageViewModel.errorEmail,
                        labelStyle: ThemePrimary.loginPageButton(context)),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(focus);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        TextFormField(
                          controller: loginPageViewModel.passController,
                          focusNode: focus,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          obscureText:
                              !loginPageViewModel.showPass ? true : false,
                          decoration: InputDecoration(
                              labelText: "PASSWORD",
                              errorText: loginPageViewModel.errorPass,
                              labelStyle:
                                  ThemePrimary.loginPageButton(context)),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (v) {
                            loginPageViewModel.onSignInClicked();
                          },
                        ),
                        GestureDetector(
                          onTap: loginPageViewModel.onTapShowPassword,
                          child: Text(
                            loginPageViewModel.showPass ? "HIDE" : "SHOW",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      onPressed: loginPageViewModel.onSignInClicked,
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
              ],
            ),
          ),
        );
        //);
      },
    );
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   loginPageViewModel.dispose();
  //   super.dispose();
  // }
}

import 'package:epos_source_flutter/src/app/app_localizations.dart';
import 'package:epos_source_flutter/src/app/helper/index.dart';
import 'package:epos_source_flutter/src/app/pages/login/login_page_viewmodel.dart';

import 'package:epos_source_flutter/src/app/theme/sizeConfig.dart';
import 'package:epos_source_flutter/src/app/theme/theme_primary.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/login";
  @override
  Widget build(BuildContext context) {
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
    Common.initFontSize(context);
//    print('sizeConfig ${SizeConfig.safeBlockHorizontal * 30}');
    var viewmodel = Provider.of<LoginPageViewModel>(context);
    viewmodel.context = context;
    return StreamBuilder<Object>(
      stream: viewmodel.loginStream,
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
                  height: 100,
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
                  child: Text(translation.text("LOGIN_PAGE.WELCOME"),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: Common.setFontSize(30))),
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  hint: DropdownMenuItem(
                    value: null,
                    child: Text(translation.text("LOGIN_PAGE.CHOOSE_DOMAIN")),
                  ),
                  items: viewmodel.listCompany,
                  onChanged: viewmodel.listCompanyOnchanged,
                  value: viewmodel.currentCompany,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: TextFormField(
                    controller: viewmodel.emailController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: translation.text("LOGIN_PAGE.EMAIL"),
                        errorText: viewmodel.errorEmail,
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
                          controller: viewmodel.passController,
                          focusNode: focus,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          obscureText: !viewmodel.showPass ? true : false,
                          decoration: InputDecoration(
                              labelText:
                                  translation.text("LOGIN_PAGE.PASSWORD"),
                              errorText: viewmodel.errorPass,
                              labelStyle:
                                  ThemePrimary.loginPageButton(context)),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (v) {
                            viewmodel.onSignInClicked();
                          },
                        ),
                        GestureDetector(
                          onTap: viewmodel.onTapShowPassword,
                          child: Text(
                            viewmodel.showPass
                                ? translation.text("LOGIN_PAGE.HIDE")
                                : translation.text("LOGIN_PAGE.SHOW"),
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
                      onPressed: viewmodel.onSignInClicked,
                      child: Text(
                        translation.text("LOGIN_PAGE.SIGN_IN"),
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
  //   viewmodel.dispose();
  //   super.dispose();
  // }
}

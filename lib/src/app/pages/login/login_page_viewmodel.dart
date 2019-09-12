import 'dart:async';

import 'package:epos_source_flutter/src/app/core/app_setting.dart';
import 'package:epos_source_flutter/src/app/helper/index.dart';
import 'package:epos_source_flutter/src/app/helper/validator.dart';
import 'package:epos_source_flutter/src/app/model/config-domain.dart';
import 'package:epos_source_flutter/src/app/model/index.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/configDomain/configDomain_page.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page.dart';

import 'package:epos_source_flutter/src/app/pages/tabs/tabs_check_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_sale_page.dart';
import 'package:epos_source_flutter/src/app/repository/api_master.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app_localizations.dart';

class LoginPageViewModel extends ChangeNotifier {
  // final _emailSub = BehaviorSubject<String>();
  // final _passSub = BehaviorSubject<String>();
  // final _btnSignInSub = BehaviorSubject<bool>();

  // Stream<String> get emailStream => _emailSub.stream;
  // Stream<String> get passStream => _passSub.stream;
  // Stream<bool> get btnSignInStream => _btnSignInSub.stream;

  // StreamController<bool> _showPassController = new StreamController();
  // Stream get showPassStream => _showPassController.stream;
  BuildContext context;
  StreamController _loginController = new StreamController();
  Stream get loginStream => _loginController.stream;
  Sink get loginSink => _loginController.sink;
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

// List company
  List<DropdownMenuItem<String>> _listCompany = new List();
  get listCompany => _listCompany;

  String currentCompany;

  List<dynamic> _company = [
    {'id': 1, 'name': translation.text("LOGIN_PAGE.MANUAL")},
    {'id': 2, 'name': translation.text("LOGIN_PAGE.QR_CODE")}
  ];

  LoginPageViewModel() {
    //account demo
    _emailController.text = "luan.vm@ts24corp.com";
    _passController.text = "123456";

    _emailController.addListener(() {
      if (_emailController.text.length > 1) isValidEmail();
    });
    _passController.addListener(() {
      if (_passController.text.length > 1) isValidInfo();
    });
    _listCompany = getDropDownMenuItems();
    //currentCompany = _listCompany[0].value;
  }

  void dispose() {
    print("dispose");
    // _emailSub.close();
    // _passSub.close();
    // _btnSignInSub.close();
    super.dispose();
    _loginController.close();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (dynamic comp in _company) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(
        value: comp['name'],
        child: Text(comp['name']),
      ));
    }
    return items;
  }

//OnChanged list company
  void listCompanyOnchanged(value) {
    currentCompany = value;
    print(value);
    if (value == translation.text("LOGIN_PAGE.MANUAL")) {
      Navigator.pushNamed(context, ConfigDomainPage.routeName);
    } else if (value == translation.text("LOGIN_PAGE.QR_CODE")) {
      Navigator.pushNamed(context, SaleTicketPage.routeName);
    }
    loginSink.add(value);
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

  onSignInClicked() async {
    if (isValidInfo())
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => TabsCheckPage(
    //       TabsCheckArgurment(
    //           routeChildName: CheckTicketHistoryPage.routeName),
    //     ),
    //   ),
    // );
    {
      ResPartner res = new ResPartner();
      res.id = 264;
      res.name = 'luan';
      api.updateCustomer(res);
      ConfigDomain cfd = new ConfigDomain();
      //Kiểm tra cấu hình domain
      LoadingDialog.showLoadingDialog(
          context, translation.text("WAITING_MESSAGE.INFO_DOMAIN"));
      bool _checkResult = await cfd.checkValidDomain();
      LoadingDialog.hideLoadingDialog(context);
      if (!_checkResult)
        return LoadingDialog.showMsgDialog(
            context, translation.text("ERROR_MESSAGE.WRONG_DOMAIN"));
      else {
        LoadingDialog.showLoadingDialog(
            context, translation.text("WAITING_MESSAGE.AUTH_ACCOUNT"));
        //Kiểm tra login
        var _checkLogin = await api.checkLogin(
          cfd: cfd,
          username: _emailController.text.trim(),
          password: _passController.text.trim(),
        );
        LoadingDialog.hideLoadingDialog(context);
        print(_checkLogin);
        if (_checkLogin == StatusCodeGetToken.TRUE) {
          //Kiểm tra quyền truy cập
          LoadingDialog.showLoadingDialog(
              context, translation.text("WAITING_MESSAGE.PERMISSION_CONNECT"));
          var _checkPermission = await api.checkAccessRightPOS();
          LoadingDialog.hideLoadingDialog(context);
          if (_checkPermission)
            await _chooseBusinessType();
          // Navigator.pushReplacementNamed(context, TabsCheckPage.routeName,
          //     arguments: TabsCheckArgurment(
          //         routeChildName: CheckTicketPage.routeName));
          else
            LoadingDialog.showMsgDialog(
                context, translation.text("ERROR_MESSAGE.PERMISSION_APP"));
        } else if (_checkLogin == StatusCodeGetToken.invalid_client) {
          return LoadingDialog.showMsgDialog(
              context, translation.text("ERROR_MESSAGE.WRONG_CLIENT"));
        } else if (_checkLogin == StatusCodeGetToken.invalid_domain) {
          return LoadingDialog.showMsgDialog(
              context, translation.text("ERROR_MESSAGE.CONNECT_SERVER"));
        } else {
          return LoadingDialog.showMsgDialog(
              context, translation.text("ERROR_MESSAGE.WRONG_LOGIN"));
        }
      }
    }
    // Navigator.pushNamed(context, TabsCheckPage.routeName,
    //     arguments:
    //         TabsCheckArgurment(routeChildName: CheckTicketPage.routeName));
  }

  Future<void> _chooseBusinessType() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(translation.text("NOTIFICATION")),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(translation.text("LOGIN_PAGE.CHOOSE_TYPE")),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(translation.text("LOGIN_PAGE.SALE_TICKET")),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, TabsSalePage.routeName,
                    arguments: TabsSaleArgurment(
                        routeChildName: SaleTicketPage.routeName));
              },
            ),
            FlatButton(
              child: Text(translation.text("LOGIN_PAGE.CHECK_TICKET")),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, TabsCheckPage.routeName,
                    arguments: TabsCheckArgurment(
                        routeChildName: CheckTicketPage.routeName));
              },
            ),
          ],
        );
      },
    );
  }
}

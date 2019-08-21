import 'dart:async';

import 'package:epos_source_flutter/src/app/helper/validator.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page.dart';

import 'package:epos_source_flutter/src/app/pages/tabs/tabs_check_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_sale_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix1;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

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

  List _company = ["Suối tiên", "Đầm sen"];

  LoginPageViewModel() {
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
    for (String comp in _company) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(
        value: comp,
        child: new Text(comp),
      ));
    }
    return items;
  }

//OnChanged list company
  void listCompanyOnchanged(String value) {
    currentCompany = value;
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

      await _chooseBusinessType();
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
          title: Text('Thông báo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Chọn loại hình sử dụng'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Bán vé'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, TabsSalePage.routeName,
                    arguments: TabsSaleArgurment(
                        routeChildName: SaleTicketPage.routeName));
              },
            ),
            FlatButton(
              child: Text('Soát vé'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, TabsCheckPage.routeName,
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

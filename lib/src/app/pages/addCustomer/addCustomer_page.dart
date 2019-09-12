import 'package:epos_source_flutter/src/app/app_localizations.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/model/index.dart';
import 'package:epos_source_flutter/src/app/pages/addCustomer/addCustomer_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/theme/theme_primary.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AddCustomerPage extends StatefulWidget {
  static const String routeName = '/addCustomer';
  final ResPartner customer;

  AddCustomerPage({Key key, this.customer}) : super(key: key);

  @override
  _AddCustomerPageState createState() {
    return _AddCustomerPageState();
  }
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  AddCustomerViewModel viewModel = AddCustomerViewModel();

  @override
  void initState() {
    viewModel.reloadData(widget.customer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      viewmodel: viewModel,
      child: StreamBuilder<Object>(
          stream: viewModel.stream,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: _appBar(viewModel),
              body: AddCustomerBodyWidget(cus: widget.customer),
            );
          }),
    );
  }

  Widget _appBar(AddCustomerViewModel viewModel) => GradientAppBar(
        title: Text(translation.text("CUSTOMER_TICKET.ADD_CUSTOMER")),
        backgroundColorStart: Theme.of(context).primaryColor,
        backgroundColorEnd: Color(0Xff135691),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              viewModel.onAddCustomer(context);
            },
            child: Text(
              translation.text("CUSTOMER_TICKET.SAVE"),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      );
}

class AddCustomerBodyWidget extends StatefulWidget {
  final ResPartner cus;

  AddCustomerBodyWidget({Key key, this.cus}) : super(key: key);

  @override
  _AddCustomerBodyWidgetState createState() {
    return _AddCustomerBodyWidgetState();
  }
}

class _AddCustomerBodyWidgetState extends State<AddCustomerBodyWidget> {
  AddCustomerViewModel viewModel;
  AddCustomerPage vm = AddCustomerPage();

  final focusEmail = FocusNode();
  final focusPhone = FocusNode();
  final focusAddress = FocusNode();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = ViewModelProvider.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              child: TextFormField(
                controller: viewModel.nameController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                autofocus: true,
                decoration: InputDecoration(
                    labelText:
                        translation.text("CUSTOMER_TICKET.NAME_CUSTOMER"),
                    errorText: viewModel.errorName,
                    labelStyle: ThemePrimary.loginPageButton(context)),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focusEmail);
                },
              ),
            ),
            Container(
              child: TextFormField(
                controller: viewModel.emailController,
                focusNode: focusEmail,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText:
                        translation.text("CUSTOMER_TICKET.EMAIL_CUSTOMER"),
                    errorText: viewModel.errorEmail,
                    labelStyle: ThemePrimary.loginPageButton(context)),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focusPhone);
                },
              ),
            ),
            Container(
              child: TextFormField(
                controller: viewModel.phoneController,
                focusNode: focusPhone,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText:
                        translation.text("CUSTOMER_TICKET.PHONE_CUSTOMER"),
                    errorText: viewModel.errorPhone,
                    labelStyle: ThemePrimary.loginPageButton(context)),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focusAddress);
                },
              ),
            ),
            Container(
              child: TextFormField(
                controller: viewModel.addressController,
                focusNode: focusAddress,
                maxLines: 1,
                minLines: 1,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText:
                        translation.text("CUSTOMER_TICKET.ADDRESS_CUSTOMER"),
                    labelStyle: ThemePrimary.loginPageButton(context)),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (v) {
                  viewModel.onAddCustomer(context);
                },
              ),
            ),
//            LoadingSpinner.loadingView(
//                context: context, loading: viewModel.loading),
          ],
        ),
      ),
    );
  }
}

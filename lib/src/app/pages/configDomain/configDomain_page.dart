import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/configDomain/configDomain_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/theme/theme_primary.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ConfigDomainPage extends StatefulWidget {
   static const String routeName = "/configDomain";
  @override
  _ConfigDomainPageState createState() => _ConfigDomainPageState();
}

class _ConfigDomainPageState extends State<ConfigDomainPage> {
  ConfigDomainPageViewModel viewModel = ConfigDomainPageViewModel();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(viewModel),
      body: ViewModelProvider(
        viewmodel: viewModel,
        child: ConfigDomainBodyWidget(),
      ),
    );
  }

  Widget _appBar(ConfigDomainPageViewModel viewModel) =>
      GradientAppBar(
        title: Text("Cấu hình domain"),
        backgroundColorStart: Colors.blue,
        backgroundColorEnd: Color(0Xff135691),
        // bottom: TabBar(
        //   tabs: <Widget>[Text('Một'), Text('Hai')],
        // ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              viewModel.onSaveConfigDomain();
            },
            child: Text(
              "Lưu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      );
}
// class ConfigDomainPage extends StatelessWidget {
//   static const String routeName = "/configDomain";
//   @override
//   Widget build(BuildContext context) {
//     ConfigDomainPageViewModel viewModel = ConfigDomainPageViewModel();
//     return Scaffold(
//       appBar: _appBar(viewModel),
//       body: ViewModelProvider(
//         viewmodel: viewModel,
//         child: ConfigDomainBodyWidget(),
//       ),
//     );
//   }

//   Widget _appBar(ConfigDomainPageViewModel viewModel) =>
//       GradientAppBar(
//         title: Text("Cấu hình domain"),
//         backgroundColorStart: Colors.blue,
//         backgroundColorEnd: Color(0Xff135691),
//         // bottom: TabBar(
//         //   tabs: <Widget>[Text('Một'), Text('Hai')],
//         // ),
//         actions: <Widget>[
//           FlatButton(
//             textColor: Colors.white,
//             onPressed: () {
//               viewModel.onSaveConfigDomain();
//             },
//             child: Text(
//               "Lưu",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
//           ),
//         ],
//       );
// }

class ConfigDomainBodyWidget extends StatefulWidget {
  @override
  _ConfigDomainBodyWidgetState createState() => _ConfigDomainBodyWidgetState();
}

class _ConfigDomainBodyWidgetState extends State<ConfigDomainBodyWidget> {
  ConfigDomainPageViewModel viewModel;
  final focus_client_id = FocusNode();
  final focus_client_serect = FocusNode();
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
                 controller: viewModel.domainController,
                //controller: _domainController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "DOMAIN",
                    labelStyle: ThemePrimary.loginPageButton(context)),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focus_client_id);
                },
              ),
            ),
            Container(
              child: TextFormField(
                controller: viewModel.clientIDController,
                focusNode: focus_client_id,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "CLIENT ID",
                    labelStyle: ThemePrimary.loginPageButton(context)),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focus_client_serect);
                },
              ),
            ),
            Container(
              child: TextFormField(
                controller: viewModel.clientSerectController,
                focusNode: focus_client_serect,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "CLIENT SERECT",
                    labelStyle: ThemePrimary.loginPageButton(context)),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (v) {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

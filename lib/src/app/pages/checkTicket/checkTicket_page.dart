import 'package:flutter/material.dart';
//import 'package:epos_source_flutter/src/app/pages/checkTicket/index.dart';

class CheckTicketPage extends StatelessWidget {
  static const String routeName = "/checkTicket";

  @override
  Widget build(BuildContext context) {
    // var _checkTicketBloc = new CheckTicketBloc();
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("CheckTicket"),
        ),
        //body: new CheckTicketScreen(checkTicketBloc: _checkTicketBloc),
        body: Container());
  }
}

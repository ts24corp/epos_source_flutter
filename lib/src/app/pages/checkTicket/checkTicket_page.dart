import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckTicketPage extends StatefulWidget {
  static const String routeName = "/checkTicket";
  @override
  _CheckTicketPageState createState() => _CheckTicketPageState();
}

class _CheckTicketPageState extends State<CheckTicketPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var checkTicketViewModel = Provider.of<CheckTicketViewModel>(context);
    return ChangeNotifierProvider(
      child: Scaffold(
        appBar: AppBar(
          title: Text("QR Scanner"),
        ),
        body: Center(
          child: Text(
            checkTicketViewModel.result,
            style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.scanner),
          label: Text("Scan"),
          onPressed: checkTicketViewModel.scanQR,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      builder: (context) => CheckTicketViewModel(),
    );
  }
}

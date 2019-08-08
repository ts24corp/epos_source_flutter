import 'package:epos_source_flutter/src/app/core/base-viewmodel/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckTicketPage extends StatelessWidget {
  static const String routeName = "/checkTicket";

  @override
  Widget build(BuildContext context) {
    var checkTicketViewModel = new CheckTicketViewModel();
    return ViewModelProvider(
      viewmodel: checkTicketViewModel,
      child: StreamBuilder<Object>(
          stream: checkTicketViewModel.checkTicketStream,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                title: Text(checkTicketViewModel.result),
              ),
              body: CheckTicketBodyWidget(),
              floatingActionButton: FloatingActionButton.extended(
                icon: Icon(Icons.scanner),
                label: Text("Scan"),
                onPressed: checkTicketViewModel.scanQR,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }),
    );
  }
}

class CheckTicketBodyWidget extends StatefulWidget {
  @override
  _CheckTicketBodyWidgetState createState() => _CheckTicketBodyWidgetState();
}

class _CheckTicketBodyWidgetState extends State<CheckTicketBodyWidget> {
  CheckTicketViewModel checkTicketViewModel;
  @override
  Widget build(BuildContext context) {
    checkTicketViewModel = ViewModelProvider.of(context);
    return Center(
      child: Text(
        checkTicketViewModel.result,
        style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

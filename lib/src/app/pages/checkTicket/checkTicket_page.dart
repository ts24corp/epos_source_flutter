import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckTicketPage extends StatelessWidget {
  static const String routeName = "/checkTicket";
  const CheckTicketPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var checkTicketViewModel = new CheckTicketViewModel();
    return ViewModelProvider(
      viewmodel: checkTicketViewModel,
      child: StreamBuilder<Object>(
          stream: checkTicketViewModel.checkTicketStream,
          builder: (context, snapshot) {
            return Scaffold(
                appBar: _appBar(checkTicketViewModel),
                body: CheckTicketBodyWidget(),
                floatingActionButton:
                    _floatingActionButton(checkTicketViewModel),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat);
          }),
    );
  }

  Widget _appBar(viewModel) => AppBar(
        title: Text(viewModel.result),
      );

  Widget _floatingActionButton(viewModel) => FloatingActionButton.extended(
        icon: Icon(Icons.scanner),
        label: Text("Scan"),
        onPressed: viewModel.scanQR,
      );
}

class CheckTicketBodyWidget extends StatefulWidget {
  @override
  _CheckTicketBodyWidgetState createState() => _CheckTicketBodyWidgetState();
}

class _CheckTicketBodyWidgetState extends State<CheckTicketBodyWidget> {
  CheckTicketViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    viewModel = ViewModelProvider.of(context);
    return Center(
      child: Text(
        viewModel.result,
        style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

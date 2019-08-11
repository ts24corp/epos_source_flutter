import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        title: Text("Soát vé"),
      );

  Widget _floatingActionButton(viewModel) => FloatingActionButton.extended(
        icon: Icon(FontAwesomeIcons.qrcode),
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
    if (viewModel.result != "111") {
      return Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: <Widget>[

            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Ma dat ve"),
              ],
            ),
            
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Ma dat ve"),
                Text("Ma dat ve")
              ],
            )
            ,
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Ma dat ve"),
                Text("Ma dat ve")
              ],
            )
           // Divider(color: Colors.blue)
          ],
        )
      );
    } else {
      return Container();
    }
  }
}

import 'package:epos_source_flutter/src/app/pages/customerTicket/customerTicket_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CustomerTicketPage extends StatefulWidget {
  static const String routeName = '/customerTicket';

  @override
  _CustomerTicketPageState createState() {
    return _CustomerTicketPageState();
  }
}

class _CustomerTicketPageState extends State<CustomerTicketPage> {
  CustomerTickerViewModel viewModel = CustomerTickerViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(viewModel),
      body: CustomerTicketBodyWidget(),
    );
  }

  Widget _appBar(CustomerTickerViewModel viewModel) => GradientAppBar(
        title: Text("Customer Ticket Page"),
        backgroundColorStart: Colors.blue,
        backgroundColorEnd: Color(0Xff135691),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {},
            child: Text(
              "Lưu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      );
}

class CustomerTicketBodyWidget extends StatefulWidget {
  @override
  _CustomerTicketBodyWidgetState createState() {
    return _CustomerTicketBodyWidgetState();
  }
}

class _CustomerTicketBodyWidgetState extends State<CustomerTicketBodyWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.orange,
      child: InkWell(
        onTap: () { print('Xoa');},
        child: Chip(
          backgroundColor: Colors.white,
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: Text('\$'),
          ),
          label: Text('500.000', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

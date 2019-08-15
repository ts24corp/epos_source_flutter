import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_sale_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SaleTicketPage extends StatelessWidget {
  static const String routeName = "/saleTicket";

  @override
  Widget build(BuildContext context) {
    TabsSaleViewModel viewModel = ViewModelProvider.of(context);
    var saleTicketViewModel = viewModel.saleTicketViewModel;
    return ViewModelProvider(
      viewmodel: saleTicketViewModel,
      child: StreamBuilder<Object>(
          stream: saleTicketViewModel.stream,
          builder: (context, snapshot) {
            return new Scaffold(
              appBar: _appBar(viewModel),
              body: SaleTicketBodyWidget(),
            );
          }),
    );
  }

  Widget _appBar(TabsSaleViewModel viewModel) => GradientAppBar(
        title: Text("Bán vé"),
        backgroundColorStart: Colors.blue,
        backgroundColorEnd: Color(0Xff135691),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {},
            child: Text(
              "Lưu",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      );
}

class SaleTicketBodyWidget extends StatefulWidget {
  @override
  _SaleTicketBodyWidgetState createState() => _SaleTicketBodyWidgetState();
}

class _SaleTicketBodyWidgetState extends State<SaleTicketBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _areaSale(),
            _dateTime(),
            _ticketState(),
            _customerName(),
            _phoneNumber(),
          ],
        ),
      ),
    );
  }

  Widget _areaSale() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              "Khu vực bán",
              style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: Text("label",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          )
        ],
      );

  Widget _dateTime() => Container();

  Widget _ticketState() => Container();

  Widget _customerName() => Container();

  Widget _phoneNumber() => Container();
}

import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_sale_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class SaleTicketPage extends StatelessWidget {
  static const String routeName = "/saleTicket";

  @override
  Widget build(BuildContext context) {
    TabsSaleViewModel viewModel = ViewModelProvider.of(context);
    var saleTicketViewModel = viewModel.saleTicketViewModel;
    saleTicketViewModel.context = context;
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
  SaleTicketViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    viewModel = ViewModelProvider.of(context);
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
          GestureDetector(
            onTap: viewModel.areaSaleOnTap,
            child: Row(
              children: <Widget>[
                Text(
                  'Chọn khu vực',
                  style: TextStyle(
                    color: Color(0xffb6b8b6),
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xffb6b8b6),
                )
              ],
            ),
          )
        ],
      );

  Widget _dateTime() => Container();

  Widget _ticketState() => Container();

  Widget _customerName() => Container();

  Widget _phoneNumber() => Container();
}

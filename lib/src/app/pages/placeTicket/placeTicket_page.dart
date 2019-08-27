import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/placeTicket/placeTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_sale_viewmodel.dart';
import 'package:flutter/material.dart';

class PlaceTicketPage extends StatelessWidget {
  static const String routeName = "/placeTicket";

  @override
  Widget build(BuildContext context) {
    TabsSaleViewModel viewModel = ViewModelProvider.of(context);
    var placeTicketViewModel = viewModel.placeTicketViewModel;
    return ViewModelProvider(
      viewmodel: placeTicketViewModel,
      child: StreamBuilder<Object>(
          stream: placeTicketViewModel.stream,
          builder: (context, snapshot) {
            return DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Place Ticker Page'),
                ),
                body: PlaceTicketBodyWidget(),
              ),
            );
          }),
    );
  }
}

class PlaceTicketBodyWidget extends StatefulWidget {
  @override
  _PlaceTicketBodyWidgetState createState() => _PlaceTicketBodyWidgetState();
}

class _PlaceTicketBodyWidgetState extends State<PlaceTicketBodyWidget> {
  PlaceTicketViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    viewModel = ViewModelProvider.of(context);
    var _placeList = viewModel.placeList;
    print('List ${viewModel.placeList}');
    return ListView.builder(
      itemCount: _placeList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print("Card Clicked $index & ${_placeList[index]}");
            Navigator.pushNamed(context, SaleTicketPage.routeName);
          },
          child: _makeCard(
              _placeList[index]['placeName'], _placeList[index]['status']),
        );
      },
    );
  }
}

Widget _makeCard(String name, bool status) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: Colors.blue,
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    elevation: 5,
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      title: Text(
        name,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Row(
        children: <Widget>[
          Icon(
            Icons.fiber_manual_record,
            color: status == true ? Colors.greenAccent : Colors.red,
            size: 20,
          ),
          Text(status == true ? 'Đang mở' : 'Đóng cửa',
              style: TextStyle(color: Colors.white))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 35),
      // onTap: () {
      //   print("ListTile Clicked");
      // },
    ),
  );
}

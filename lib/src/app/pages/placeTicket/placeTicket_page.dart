import 'package:epos_source_flutter/src/app/app_localizations.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/helper/loading_spinner.dart';
import 'package:epos_source_flutter/src/app/pages/placeTicket/placeTicket_page_viewmodel.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/tableTicket/tableTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_sale_viewmodel.dart';
import 'package:flutter/material.dart';

class PlaceTicketPage extends StatelessWidget {
  static const String routeName = "/placeTicket";

  @override
  Widget build(BuildContext context) {
    TabsSaleViewModel viewModel = ViewModelProvider.of(context);
    var placeTicketViewModel = viewModel.placeTicketViewModel;
    return StatefulWrapper(
      onInit: () {
        placeTicketViewModel.loadData();
      },
      child: ViewModelProvider(
        viewmodel: placeTicketViewModel,
        child: StreamBuilder<Object>(
            stream: placeTicketViewModel.stream,
            builder: (context, snapshot) {
              return DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(translation.text("PLACE_TICKET.PLACE_POS")),
                  ),
                  body: PlaceTicketBodyWidget(),
                ),
              );
            }),
      ),
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = ViewModelProvider.of(context);
    var _placeList = viewModel.listPosConfig;
    print('List ${_placeList}');
    return _placeList.length == 0
        ? LoadingSpinner.loadingView(context: context, loading: true)
        : ListView.builder(
            itemCount: _placeList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print("Card Clicked $index & ${_placeList[index]}");
                  if (_placeList[index].posSessionState == false) {
                    Navigator.pushNamed(context, SaleTicketPage.routeName);
                  } else {
                    Navigator.pushNamed(context, TableTicketPage.routeName);
                  }
                },
                child: _makeCard(
                    _placeList[index].name, _placeList[index].posSessionState),
              );
            },
          );
  }
}

Widget _makeCard(String name, dynamic status) {
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
            color: status == "opened" ? Colors.greenAccent : Colors.red,
            size: 20,
          ),
          Text(status == "opened" ? translation.text("PLACE_TICKET.OPEN") : translation.text("PLACE_TICKET.CLOSE"),
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

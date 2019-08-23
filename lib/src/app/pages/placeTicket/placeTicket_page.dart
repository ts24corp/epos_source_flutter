import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_sale_viewmodel.dart';
import 'package:flutter/material.dart';

class PlaceTicketPage extends StatelessWidget {
  static const String routeName = "/placeTicket";

  @override
  Widget build(BuildContext context) {
    TabsSaleViewModel viewModel = ViewModelProvider.of(context);
    var placeTicketViewModel = viewModel.placeTicketViewModel;
    return ViewModelProvider(
      viewmodel: viewModel,
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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    final makeListTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      title: Text(
        "Phòng vé",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Row(
        children: <Widget>[
          Icon(
            Icons.fiber_manual_record,
            color: Colors.greenAccent,
            size: 20,
          ),
          Text("Đang mở", style: TextStyle(color: Colors.white))
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 35),
      onTap: () {
        print("ListTile Clicked");
      },
    );

    final makeCard = Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        // decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        decoration: BoxDecoration(color: Colors.blue),
        child: makeListTile,
      ),
    );
    return InkWell(
      onTap: () {
        print("Card Clicked");
      },
      child: makeCard,
    );
    ;
  }
}

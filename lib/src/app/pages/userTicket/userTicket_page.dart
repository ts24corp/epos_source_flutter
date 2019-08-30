import 'package:epos_source_flutter/src/app/pages/placeTicket/placeTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_check_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_sale_page.dart';
import 'package:flutter/material.dart';

class UserTicketPage extends StatelessWidget {
  static const String routeName = '/userTicket';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('User Ticket'),
      ),
      body: UserTicketBodyWidget(),
    );
  }
}

class UserTicketBodyWidget extends StatefulWidget {
  @override
  _UserTicketBodyWidgetState createState() {
    return _UserTicketBodyWidgetState();
  }
}

class _UserTicketBodyWidgetState extends State<UserTicketBodyWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);
    String tabName = route.settings.name;
    // TODO: implement build
    return Container(
      child: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
        ListTile(
            leading: Icon(Icons.person),
            title: Text('Username'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.loop),
            title: tabName == TabsCheckPage.routeName
                ? Text('Sale Ticket')
                : Text('Check Ticket'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              if (route != null) {
                if (tabName == TabsCheckPage.routeName) {
                  Navigator.pushReplacementNamed(
                      context, TabsSalePage.routeName,
                      arguments: TabsSaleArgurment(
                          routeChildName: PlaceTicketPage.routeName));
                } else {
                  Navigator.pushReplacementNamed(
                      context, TabsCheckPage.routeName,
                      arguments: TabsCheckArgurment(
                          routeChildName: PlaceTicketPage.routeName));
                }
              }
            }),
        ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {}),
        ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Logout'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {}),
      ]).toList()),
    );
  }
}

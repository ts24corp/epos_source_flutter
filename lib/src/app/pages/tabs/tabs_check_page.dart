import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicketHistory/checkTicket_history_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabsCheckPage extends StatefulWidget {
  final TabsCheckArgurment arguments;
  TabsCheckPage(this.arguments);
  static const String routeName = "/tabsCheck";

  @override
  _TabsCheckPageState createState() => _TabsCheckPageState();
}

class TabsCheckArgurment {
  final String routeChildName;

  TabsCheckArgurment({this.routeChildName});
}

class _TabsCheckPageState extends State<TabsCheckPage> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    CheckTicketPage(),
    CheckTicketHistoryPage(),
  ];
  @override
  void initState() {
    super.initState();
    _navigateChild(widget.arguments);
  }

  _navigateChild(TabsCheckArgurment arg) {
    switch (arg.routeChildName) {
      case CheckTicketPage.routeName:
        currentTabIndex = 0;
        break;
      case CheckTicketHistoryPage.routeName:
        currentTabIndex = 1;
        break;
    }
  }

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text("History"),
          ),
        ],
      ),
    );
  }
}

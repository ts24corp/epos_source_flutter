import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicketHistory/checkTicket_history_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_check_viewmodel.dart';
import 'package:epos_source_flutter/src/app/pages/userTicket/userTicket_page.dart';

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
    //CheckTicketPage(),
    CheckTicketPage(
        //key: PageStorageKey('CheckTicketPage'),
        ),
    CheckTicketHistoryPage(
        // key: PageStorageKey('CheckTicketHistoryPage'),
        ),
    UserTicketPage(),
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
      case UserTicketPage.routeName:
        currentTabIndex = 2;
        break;
    }
  }

  onTapped(int index) {
    setState(() => currentTabIndex = index);
  }

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: PageStorage(
    //     child: tabs[currentTabIndex],
    //     bucket: bucket,
    //   ),
    //   // body: tabs[currentTabIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     onTap: onTapped,
    //     currentIndex: currentTabIndex,
    //     items: [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         title: Text("Home"),
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.history),
    //         title: Text("History"),
    //       ),
    //     ],
    //   ),
    // );
    var viewModel = new TabsCheckViewModel();
    return Scaffold(
      // body: PageStorage(
      //   child: tabs[currentTabIndex],
      //   bucket: bucket,
      // ),
      ///Keep state of each page when change tab
      body: ViewModelProvider(
        viewmodel: viewModel,
        child: IndexedStack(
          index: currentTabIndex,
          children: tabs,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: currentTabIndex,
        onTap: onTapped,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Color(0xffFAFAFA),
        color: Theme.of(context).primaryColor,
        height: 50,
        // currentIndex: currentTabIndex,
        items: <Widget>[
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.history,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

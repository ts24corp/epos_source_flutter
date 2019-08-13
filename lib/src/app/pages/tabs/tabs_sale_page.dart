import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:epos_source_flutter/src/app/core/baseViewModel.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicketHistory/saleTicketHistory_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_sale_viewmodel.dart';
import 'package:flutter/material.dart';

class TabsSalePage extends StatefulWidget {
  final TabsSaleArgurment arguments;
  TabsSalePage(this.arguments);
  static const String routeName = "/tabsSale";

  @override
  _TabsSalePageState createState() => _TabsSalePageState();
}

class TabsSaleArgurment {
  final String routeChildName;

  TabsSaleArgurment({this.routeChildName});
}

class _TabsSalePageState extends State<TabsSalePage> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    //CheckTicketPage(),
    SaleTicketPage(
        //key: PageStorageKey('CheckTicketPage'),
        ),
    SaleTicketHistoryPage(
        // key: PageStorageKey('CheckTicketHistoryPage'),
        ),
  ];
  @override
  void initState() {
    super.initState();
    _navigateChild(widget.arguments);
  }

  _navigateChild(TabsSaleArgurment arg) {
    switch (arg.routeChildName) {
      case SaleTicketPage.routeName:
        currentTabIndex = 0;
        break;
      case SaleTicketHistoryPage.routeName:
        currentTabIndex = 1;
        break;
    }
  }

  onTapped(int index) {
    setState(() => currentTabIndex = index);
  }

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    var viewModel = new TabsSaleViewModel();
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
        ],
      ),
    );
  }
}

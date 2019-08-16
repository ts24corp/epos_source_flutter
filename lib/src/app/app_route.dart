import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicketHistory/checkTicket_history_page.dart';
import 'package:epos_source_flutter/src/app/pages/login/login_page.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicketHistory/saleTicketHistory_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_check_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_sale_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> route = {
    '/': (context) => LoginPage(),
    LoginPage.routeName: (context) => LoginPage(),
    TabsCheckPage.routeName: (context) =>
        TabsCheckPage(ModalRoute.of(context).settings.arguments),
    CheckTicketPage.routeName: (context) => CheckTicketPage(),
    CheckTicketHistoryPage.routeName: (context) => CheckTicketHistoryPage(),
    TabsSalePage.routeName: (context) =>
        TabsSalePage(ModalRoute.of(context).settings.arguments),
    SaleTicketHistoryPage.routeName: (context) => SaleTicketHistoryPage(),
    SaleTicketPage.routeName: (context) => SaleTicketPage()
  };
}
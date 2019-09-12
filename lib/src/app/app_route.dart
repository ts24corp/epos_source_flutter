import 'package:epos_source_flutter/src/app/pages/addCustomer/addCustomer_page.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicketHistory/checkTicket_history_page.dart';
import 'package:epos_source_flutter/src/app/pages/configDomain/configDomain_page.dart';
import 'package:epos_source_flutter/src/app/pages/customerTicket/customerTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/invoiceTicket/invoiceTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/login/login_page.dart';
import 'package:epos_source_flutter/src/app/pages/payTicket/payTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/placeTicket/placeTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicket/saleTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/saleTicketHistory/saleTicketHistory_page.dart';
import 'package:epos_source_flutter/src/app/pages/splitTicket/splitTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/tableTicket/tableTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_check_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_sale_page.dart';
import 'package:epos_source_flutter/src/app/pages/userTicket/userTicket_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Map<String, WidgetBuilder> route = {
    '/': (context) => LoginPage(),
    LoginPage.routeName: (context) => LoginPage(),
    TabsCheckPage.routeName: (context) =>
        TabsCheckPage(ModalRoute.of(context).settings.arguments),
    CheckTicketPage.routeName: (context) => CheckTicketPage(),
    CheckTicketHistoryPage.routeName: (context) => CheckTicketHistoryPage(),
    TabsSalePage.routeName: (context) =>
        TabsSalePage(ModalRoute.of(context).settings.arguments),
    SaleTicketHistoryPage.routeName: (context) => SaleTicketHistoryPage(),
    SaleTicketPage.routeName: (context) => SaleTicketPage(),
    ConfigDomainPage.routeName: (context) => ConfigDomainPage(),
    PlaceTicketPage.routeName: (context) => PlaceTicketPage(),
    PayTicketPage.routeName: (context) => PayTicketPage(),
    SplitTicketPage.routeName: (context) => SplitTicketPage(),
    CustomerTicketPage.routeName: (context) => CustomerTicketPage(),
    UserTicketPage.routeName: (context) => UserTicketPage(),
    TableTicketPage.routeName: (context) => TableTicketPage(),
    InvoiceTicketPage.routeName: (context) => InvoiceTicketPage(),
    AddCustomerPage.routeName: (context) => AddCustomerPage(),
  };
}

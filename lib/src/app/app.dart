import 'package:epos_source_flutter/src/app/pages/checkTicket/checkTicket_page.dart';
import 'package:epos_source_flutter/src/app/pages/checkTicketHistory/checkTicket_history_page.dart';
import 'package:epos_source_flutter/src/app/pages/login/login_page.dart';
import 'package:epos_source_flutter/src/app/pages/tabs/tabs_check_page.dart';
import 'package:epos_source_flutter/src/app/theme/theme_primary.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemePrimary.theme(),
        initialRoute: '/',
        routes: Routes.route
        // home: LoginPage()
        );
  }
}

class Routes {
  static Map<String, WidgetBuilder> route = {
    '/': (context) => LoginPage(),
    LoginPage.routeName: (context) => LoginPage(),
    TabsCheckPage.routeName: (context) =>
        TabsCheckPage(ModalRoute.of(context).settings.arguments),
    CheckTicketPage.routeName: (context) => CheckTicketPage(),
    CheckTicketHistoryPage.routeName: (context) => CheckTicketHistoryPage(),
  };
}

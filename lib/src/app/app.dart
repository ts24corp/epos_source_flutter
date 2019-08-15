import 'package:epos_source_flutter/src/app/theme/theme_primary.dart';
import 'package:flutter/material.dart';

import 'app_route.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemePrimary.theme(),
        initialRoute: '/',
        routes: Routes.route
        //  home: LoginPage()
        );
  }
}

import 'package:epos_source_flutter/src/app/theme/theme_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';
import 'app_route.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemePrimary.theme(),
//       initialRoute: '/',
//       routes: Routes.route,
//       //  home: LoginPage()
//       //Init locale lang
//       supportedLocales: [Locale('en', 'US'), Locale('vi', 'VN')],
//       // These delegates make sure that the localization data for the proper language is loaded
//       localizationsDelegates: [
//         // A class which loads the translations from JSON files
//         //  AppLocalizations.delegate,
//         // Built-in localization of basic text for Material widgets
//         GlobalMaterialLocalizations.delegate,
//         // Built-in localization for text direction LTR/RTL
//         GlobalWidgetsLocalizations.delegate,
//       ],
//       // Returns a locale which will be used by the app
//       localeResolutionCallback: (locale, supportedLocales) {
//         // Check if the current device locale is supported
//         for (var supportedLocale in supportedLocales) {
//           if (supportedLocale.languageCode == locale.languageCode &&
//               supportedLocale.countryCode == locale.countryCode) {
//             return supportedLocale;
//           }
//         }
//         // If the locale of the device is not supported, use the first one
//         // from the list (English, in this case).
//         return supportedLocales.first;
//       },
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Initializes a callback should something need
    // to be done when the language is changed
    translation.onLocaleChangedCallback = _onLocaleChanged;
  }

  ///
  /// If there is anything special to do when the user changes the language
  ///
  _onLocaleChanged() async {
    // do anything you need to do if the language changes
    print('Language has been changed to: ${translation.currentLanguage}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemePrimary.theme(),
      initialRoute: '/',
      routes: Routes.route,
      //  home: LoginPage()
      //Init locale lang
      // Tells the system which are the supported languages
      supportedLocales: translation.supportedLocales(),
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}

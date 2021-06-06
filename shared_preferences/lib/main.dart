import 'package:flutter/material.dart';
import 'package:shared_preferences/src/pages/home_page.dart';
import 'package:shared_preferences/src/pages/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routename: (BuildContext context) => SettingsPage(),
      },
    );
  }
}

import 'package:bankapp/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:bankapp/pages/botom_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => LoginPage(),
        'menuOptions': (BuildContext context) => NavigationBottom(),
      },
      /*  */
    );
  }
}

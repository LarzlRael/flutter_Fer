import 'package:desing/src/screens/basico_page.dart';
import 'package:desing/src/screens/botones_page.dart';
import 'package:desing/src/screens/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Change the status bar
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'botones',
      routes: {
        'basico': (BuildContext context) => BasicoPage(),
        'scroll': (BuildContext context) => ScrollPage(),
        'botones': (BuildContext context) => Botonespage(),
      },
    );
  }
}

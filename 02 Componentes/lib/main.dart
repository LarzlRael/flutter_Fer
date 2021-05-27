import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getAplicationRoutes(),
      // <String, WidgetBuilder>{
      //   '/': (BuildContext context) => HomePage(),
      //   'alert': (BuildContext context) => AlertPage(),
      //   'avatar': (BuildContext context) => AvatarPage(),
      // },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}

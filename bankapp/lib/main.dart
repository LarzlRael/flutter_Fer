import 'package:bankapp/pages/home_page.dart';
import 'package:bankapp/pages/login_page.dart';
import 'package:bankapp/sharedPreferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:bankapp/pages/botom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => HomePage(),
        'menuOptions': (BuildContext context) => NavigationBottom(),
      },
      theme: ThemeData(
        primaryColor: Color(0xff01B55A),
        accentColor: Color(0xff01B55A),
        iconTheme: IconThemeData(
          color: Color(0xff01B55A),
        ),
        /*  bottomNavigationBarTheme: BottomNavigationBarThemeData(
          
          elevation: 1,
          unselectedLabelStyle: TextStyle(
            fontSize: 13,
          ),
          unselectedIconTheme: IconThemeData(
            size: 21,
          ),
          selectedIconTheme: IconThemeData(
            color: Color(0xff734583),
            size: 22,
          ),
          
          selectedLabelStyle: TextStyle(
            color: Colors.black,
          ),
        ), */
      ),
      /*  */
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared/shared_prefs/preferences_usuario.dart';
import 'package:shared/src/pages/home_page.dart';
import 'package:shared/src/pages/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = UserPreferences();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routename: (BuildContext context) => SettingsPage(),
      },
    );
  }
}

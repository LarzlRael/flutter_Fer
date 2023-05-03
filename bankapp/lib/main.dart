import 'package:bankapp/provider/provider.dart';
import 'package:bankapp/sharedPreferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProviderNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<ThemeProviderNotifier>().appTheme;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: appTheme.getTheme(),
    );
  }
}

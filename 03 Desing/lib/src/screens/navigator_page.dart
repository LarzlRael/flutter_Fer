import 'package:flutter/material.dart';

import 'dart:ui';

import 'package:desing/src/screens/basico_page.dart';
import 'package:desing/src/screens/buttons_page.dart';
import 'package:desing/src/screens/scroll_page.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      bottomNavigationBar: _bottomNavigatorBar(context),
    );
  }

  _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return BasicoPage();
      case 1:
        return ScrollPage();
      case 2:
        return ButtonsPage();
    }
  }

  _bottomNavigatorBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(
                color: Color.fromRGBO(116, 117, 152, 1.0),
              ),
            ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_outline_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: ''),
        ],
      ),
    );
  }
}

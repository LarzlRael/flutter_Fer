import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Botonespage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: [
                _titulos(),
                _roundedButtons(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigatorBar(context),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.6),
            end: FractionalOffset(0.0, 1.0),
            colors: [
              Color.fromRGBO(52, 54, 101, 1),
              Color.fromRGBO(35, 37, 57, 1),
            ]),
      ),
    );

    final pinkBox = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            color: Colors.pink,
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0),
            ])),
      ),
    );

    return Stack(
      children: [
        gradiente,
        Positioned(
          top: -100.0,
          child: pinkBox,
        ),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Clasify transaction',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10.0,
            ),
            Text('Clasify this transacion into a particular category',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
          ],
        ),
      ),
    );
  }

  _bottomNavigatorBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        cardColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(
                color: Color.fromRGBO(116, 117, 152, 1.0),
              ),
            ),
      ),
      child: BottomNavigationBar(
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

  Widget _roundedButtons() {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBottomRendoneado(Colors.blue, Icons.border_all, 'General'),
            _crearBottomRendoneado(
                Colors.purpleAccent, Icons.directions_bike, 'Bus'),
          ],
        ),
        TableRow(
          children: [
            _crearBottomRendoneado(Colors.pinkAccent, Icons.shop, 'Compras'),
            _crearBottomRendoneado(
                Colors.orange, Icons.insert_drive_file, 'File'),
          ],
        ),
        TableRow(
          children: [
            _crearBottomRendoneado(Colors.green, Icons.cloud, 'Entetairment'),
            _crearBottomRendoneado(Colors.red, Icons.collections, 'Photos'),
          ],
        ),
      ],
    );
  }

  Widget _crearBottomRendoneado(
    Color color,
    IconData icono,
    String texto,
  ) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.4, sigmaY: 0.2),
      child: Container(
        height: 180.0,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 35.0,
              child: Icon(icono, color: Colors.white, size: 30.0),
            ),
            Text('$texto', style: TextStyle(color: color)),
            SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}

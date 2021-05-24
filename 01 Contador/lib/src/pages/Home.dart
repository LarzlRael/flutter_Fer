import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int conteo = 10;

  final TextStyle textStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: Colors.black.withOpacity(0.5),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Este esta es la frase',
              style: textStyle,
            ),
            Text(
              'Esta es el author',
              style: textStyle,
            ),
            Text(
              '$conteo',
              style: textStyle,
            ),
          ],
        ),
      ),
      floatingActionButton: _createBotones(),
    );
  }

  Widget _createBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        createFloating(Icons.access_alarm),
        createFloating(Icons.add),
        createFloating(Icons.subscript_sharp),
      ],
    );
  }

  FloatingActionButton createFloating(IconData icon) {
    return FloatingActionButton(
        child: Icon(icon),
        onPressed: () {
          setState(() {
            conteo = conteo + 10;
          });
        });
  }
}

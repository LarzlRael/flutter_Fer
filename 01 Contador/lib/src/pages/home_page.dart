import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextStyle estiloTexto = TextStyle(fontSize: 25);
  int conteo = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
        elevation: 0.1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Número de clicks',
              style: estiloTexto,
            ),
            Text(
              '$conteo',
              style: estiloTexto,
            ),
          ],
        ),
      ),
      // floation Action button location
      /* floatingActionButtonLocation: FloatingActionButtonLocation.startTop, */
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(width: 30),
        FloatingActionButton(
            child: Icon(Icons.exposure_zero),
            onPressed: () {
              setState(() {
                conteo = 0;
              });
            }),
        Expanded(
          child: SizedBox(),
        ),
        FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                conteo = conteo - 1;
              });
            }),
        SizedBox(width: 5.0),
        FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                conteo = conteo + 1;
              });
            }),
      ],
    );
  }
}

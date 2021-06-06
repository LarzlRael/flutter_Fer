import 'package:flutter/material.dart';
import 'package:bankapp/widgets/grid_options.dart';

class OperacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Productos',
          style: TextStyle(color: Colors.deepPurpleAccent),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        /* child: Text('Hola mundo'), */
        child: GridOptions(),
      ),
    );
  }
}

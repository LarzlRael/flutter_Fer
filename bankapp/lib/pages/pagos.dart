import 'package:flutter/material.dart';

import 'package:bankapp/widgets/grid_options.dart';

class Pagos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pagos",
          style: TextStyle(
            color: Color(0xff734583),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GridOptions(),
    );
  }
}

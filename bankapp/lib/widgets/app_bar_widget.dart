import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String? label;

  AppBarWidget({@required this.label});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        label!,
        style: TextStyle(color: Colors.deepPurpleAccent),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}

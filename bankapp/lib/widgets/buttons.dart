import 'package:flutter/material.dart';

Widget singleButton(
  BuildContext context,
  String title,
  String navigatorName, {
  Color color = Colors.blue,
}) {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, navigatorName);
        print('nos vamos a $navigatorName');
      },
      style: buttonStyle(color),
      child: Text(title),
    ),
  );
}

ButtonStyle buttonStyle(Color color) {
  return TextButton.styleFrom(
    primary: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    backgroundColor: color,
  );
}

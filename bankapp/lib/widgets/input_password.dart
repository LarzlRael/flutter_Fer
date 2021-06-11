import 'package:bankapp/sharedPreferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class InputPassword extends StatefulWidget {
  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool hidePassword = true;
  String textFieldValue = '';
  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: TextField(
        keyboardType: TextInputType.number,
        // maxLength: 4,
        obscureText: hidePassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: 'Clave',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hidePassword = hidePassword ? false : true;
              });
            },
            icon: Icon(hidePassword ? Ionicons.eye_off : Ionicons.eye),
          ),
        ),
        onChanged: (value) {
          setState(() {
            textFieldValue = value;
            prefs.password = value;
          });
        },
      ),
    );
  }
}

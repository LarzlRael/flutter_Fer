import 'package:flutter/material.dart';
import 'package:shared/shared_prefs/preferences_usuario.dart';

final prefs = UserPreferences();

TextStyle styleText() {
  return TextStyle(
    color: prefs.darkTheme ? Colors.white : Colors.black,
  );
}

Color color() {
  return prefs.darkTheme ? Colors.purple : Colors.blue;
}

Color setBackGroundColor() {
  return (prefs.darkTheme) ? Colors.grey[850] : Colors.white;
}

Color setRadioAndCheckBoxColor() {
  return (prefs.darkTheme) ? Colors.purple : Colors.blue;
}

Color setAppBarColor() {
  return (prefs.darkTheme) ? Colors.purple : Colors.blue;
}

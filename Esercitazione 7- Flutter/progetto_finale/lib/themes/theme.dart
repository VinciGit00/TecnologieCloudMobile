import 'package:flutter/material.dart';

final ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  buttonColor: Colors.cyan,
  appBarTheme: const AppBarTheme(
    color: Colors.cyan,
  ),
  accentColor: Colors.white,
  primaryColor: Colors.cyan,
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.deepPurple, //  <-- dark color
    textTheme:
        ButtonTextTheme.primary, //  <-- this auto selects the right color
  ),
);

final ThemeData white = ThemeData(
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
  ),
  primaryColor: Colors.blue,
  accentColor: Colors.blue,
);

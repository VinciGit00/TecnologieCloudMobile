import 'package:flutter/material.dart';

final ThemeData dark = ThemeData(
  //brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    color: Color(0xFFEE4540),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFF510A32),
  ),
  primaryColor: Color(0xFF801336),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.deepPurple, //  <-- dark color
    textTheme:
        ButtonTextTheme.primary, //  <-- this auto selects the right color
  ),
);

final ThemeData white = ThemeData(
  //brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    color: Color(0xFFD53E0F),
  ),
  primaryColor: Color(0xFFD53E0F),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Color(0xFFFA8743),
  ),
);

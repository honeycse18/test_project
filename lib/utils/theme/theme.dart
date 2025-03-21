import 'package:flutter/material.dart';

class AppThemeData {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Montserrat',
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 36, color: Colors.black, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 24,
          fontFamily: 'Montserrat',
          color: Colors.black,
          fontWeight: FontWeight.bold),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Montserrat',
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 24,
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.bold),
    ),
  );
}

import 'package:flutter/material.dart';

class MyTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
  );
}

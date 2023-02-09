import 'package:flutter/material.dart';

class MyButtomtheme {
  static ElevatedButtonThemeData MyLightButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.grey.shade800),
      backgroundColor: MaterialStateProperty.all(Colors.white54),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), side: BorderSide.none),
      ),
    ),
  );
}

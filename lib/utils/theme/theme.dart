import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xfff8faff),
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.grey.shade600,
      ),
      foregroundColor: Colors.grey.shade600,
      backgroundColor: const Color(0xfff8faff),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff0568fd),
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff041955)),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff3450a1),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white54,
      actionsIconTheme: IconThemeData(
        color: Colors.white54,
      ),
      backgroundColor: Color(0xff3450a1),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xffeb06ff), foregroundColor: Colors.white),
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff041955)),
  );
}

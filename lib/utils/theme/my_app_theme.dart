import 'package:flutter/material.dart';
import 'package:todo_riverpod/utils/theme/app_bar_theme.dart';
import 'package:todo_riverpod/utils/theme/text_theme.dart';

class MyAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xfff8faff),
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff0568fd),
    ),
    drawerTheme: DrawerThemeData(backgroundColor: Colors.grey.shade300),
    textTheme: MyTextTheme.lightTextTheme,
    cardColor: Colors.grey.shade300,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff3450a1),
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xffeb06ff), foregroundColor: Colors.white),
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff041955)),
    textTheme: MyTextTheme.darkTextTheme,
    cardColor: Color(0xff041955),
  );
}

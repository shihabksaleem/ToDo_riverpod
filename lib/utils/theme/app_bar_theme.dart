import 'package:flutter/material.dart';

class MyAppBarTheme {
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Colors.grey.shade600,
    ),
    foregroundColor: Colors.grey.shade600,
    backgroundColor: const Color(0xfff8faff),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    foregroundColor: Colors.white54,
    actionsIconTheme: IconThemeData(
      color: Colors.white54,
    ),
    backgroundColor: Color(0xff3450a1),
  );
}

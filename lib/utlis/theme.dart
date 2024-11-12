import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFE6E6E6),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFFE6E6E6),
      iconTheme: IconThemeData(color: Color(0xFF000000)),
    ),
    dataTableTheme: DataTableThemeData(
      headingTextStyle: TextStyle(color: Color(0xFF1A1A1A)),
      dataTextStyle: TextStyle(color: Color(0xFF1A1A1A)),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(Color(0xFF0066FF)),
      trackColor: WidgetStateProperty.all(Color(0xFF999999)),
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(color: Color(0xFF000000)),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF000000),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF000000),
      iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    ),
    dataTableTheme: DataTableThemeData(
      headingTextStyle: TextStyle(color: Color(0xFFCCCCCC)),
      dataTextStyle: TextStyle(color: Color(0xFFCCCCCC)),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(Color(0xFFFFFFFF)),
      trackColor: WidgetStateProperty.all(Color(0xFF0066FF)),
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(color: Color(0xFFCCCCCC)),
    ),
  );
}

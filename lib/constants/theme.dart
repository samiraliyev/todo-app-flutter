import 'package:flutter/material.dart';

class AppThemeData {
  final ThemeData redTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
    ),
    scaffoldBackgroundColor: Colors.red,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.red),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(Colors.red),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.red),
    switchTheme: const SwitchThemeData(
      thumbColor: MaterialStatePropertyAll(Colors.white),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24.0,
        color: Colors.white,
      ),
    ),
    canvasColor: Colors.red,
    checkboxTheme: const CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(Colors.red),
    ),
  );

  final ThemeData greenTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      elevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.green,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.green),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24.0,
        color: Colors.white,
      ),
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(Colors.green),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.green),
    switchTheme: const SwitchThemeData(
      thumbColor: MaterialStatePropertyAll(Colors.white),
    ),
    canvasColor: Colors.green,
    checkboxTheme: const CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(Colors.green),
    ),
  );
}

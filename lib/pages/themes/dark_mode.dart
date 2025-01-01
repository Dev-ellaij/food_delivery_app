import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 20, 35, 35),
    primary: const Color.fromARGB(255, 20, 35, 35),
    secondary: const Color.fromARGB(255, 20, 35, 35),
    inversePrimary: const Color.fromARGB(255, 20, 35, 35),
    onPrimary: Colors.white,
    onSecondary: Colors.grey[300]!,
    onSurface: Colors.white,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 20, 35, 35),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
    iconTheme: IconThemeData(color: Colors.white),
  ),
);

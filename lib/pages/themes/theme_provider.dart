import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/themes/light_mode.dart';
import 'package:food_delivery_app/pages/themes/dark_mode.dart'; // Make sure to import dark mode theme

// This class provides functionality to switch between light mode and dark mode
class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightmode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkmode;

  set themeData(ThemeData themedata) {
    _themeData = themedata;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode; // Ensure `darkmode` is defined and imported
    } else {
      themeData = lightmode;
    }
  }
}

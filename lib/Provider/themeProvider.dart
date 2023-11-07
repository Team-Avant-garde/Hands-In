import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData getTheme() => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}
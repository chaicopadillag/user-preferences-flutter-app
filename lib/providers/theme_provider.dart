import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentThme;
  ThemeProvider({
    required bool isDarkMode,
  }) : currentThme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  void changeTheme(bool isDarkMode) {
    currentThme = isDarkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.system;

  ThemeMode? theme;

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == appTheme) {
      return;
    }
    appTheme = newTheme;
    theme = appTheme;
    notifyListeners();
  }

  bool isDarkTheme() {
    return appTheme == ThemeMode.dark;
  }
}

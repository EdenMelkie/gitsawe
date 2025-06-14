import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier {
  String _language = 'አማርኛ';
  double _fontSize = 16;
  bool _isDarkTheme = false;

  String get language => _language;
  double get fontSize => _fontSize;
  bool get isDarkTheme => _isDarkTheme;

  void setLanguage(String lang) {
    _language = lang;
    notifyListeners();
  }

  void setFontSize(double size) {
    _fontSize = size;
    notifyListeners();
  }

  void setTheme(bool isDark) {
    _isDarkTheme = isDark;
    notifyListeners();
  }
}

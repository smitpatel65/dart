// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  // ignore: prefer_final_fields
  var _thememode = ThemeMode.light;
  ThemeMode get themeMode => _thememode;

  void setTheme(themeMode) {
    _thememode = themeMode;
    notifyListeners();
  }
}

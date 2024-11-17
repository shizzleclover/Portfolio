import 'package:flutter/material.dart';

class Footerthemeprovider extends ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;


  bool get isLightMode => _themeMode == ThemeMode.light;


  void toggleFooterTheme(bool isLight)  {
      _themeMode = isLight ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
}
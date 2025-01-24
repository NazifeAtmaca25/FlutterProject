import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData green = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.green.shade100),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style:
            ElevatedButton.styleFrom(backgroundColor: Colors.green.shade100)),
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green.shade50);

ThemeData red = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.red.shade100),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade100)),
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red.shade50);

class ThemeDataColor with ChangeNotifier {
  static late SharedPreferences _sharedPreferences;
  bool _isGreen = true;
  bool get isGreen => _isGreen;

  ThemeData get themeColor {
    return _isGreen ? green : red;
  }

  void toggleTheme() {
    _isGreen = !_isGreen;
    saveThemetoSharedPreference(_isGreen);
    notifyListeners();
  }

  Future<void> creatSharedPreference() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveThemetoSharedPreference(bool value) {
    _sharedPreferences.setBool("themeData", value);
  }

  void loadThemetoSharedPreference() async {
    // await creatSharedPreference();
    if (_sharedPreferences.getBool("themeData") == null) {
      _isGreen = true;
    } else {
      _isGreen = _sharedPreferences.getBool("themeData")!;
    }
    notifyListeners();
  }
}

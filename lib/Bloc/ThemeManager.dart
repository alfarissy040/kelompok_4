import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeManager with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.teal,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
  );
  final lightTheme = ThemeData(
    primarySwatch: Colors.teal,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    dividerColor: Colors.white54,
  );

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  toggleTheme(bool isDark) {
    // final isDark = _themeMode == ThemeMode.dark;
    if (isDark) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}

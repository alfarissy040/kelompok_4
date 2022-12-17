import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelompok_4/Bloc/ThemeInfo.dart';

class ThemeManager with ChangeNotifier {
  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
  );
  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    dividerColor: Colors.white54,
  );

  late ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  ThemeManager() {
    ThemeInfo().getThemeInfo().then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value;
      if (themeMode == 'dark') {
        print('setting dark theme');
        _themeData = darkTheme;
      } else {
        _themeData = lightTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    ThemeInfo().setThemeInfo("dark");
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    ThemeInfo().setThemeInfo("light");
    notifyListeners();
  }
}

import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeInfo {
  void setThemeInfo(String theme) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("theme", theme);
  }

  Future<String?> getThemeInfo() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? theme = pref.getString("theme");
    return theme;
  }
}

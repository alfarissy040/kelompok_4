import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class Theme {
  void setDark(bool theme) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("theme", theme);
  }

  getDark() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? theme = pref.getBool("theme");
    return theme! ? true : false;
  }
}

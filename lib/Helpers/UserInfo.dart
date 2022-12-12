import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  Future setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString("token", value);
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  Future setUserId(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setInt("userId", value);
  }

  Future<int?> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("userId");
  }

  Future logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  // debugging purpose
  Future setIp(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString("ip", value);
  }

  Future getIp() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("ip");
  }
  // end debugging purpose
}

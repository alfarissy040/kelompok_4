import 'package:kelompok_4/Helpers/UserInfo.dart';

class LogoutBloc {
  static Future logout() async {
    await UserInfo().logout();
  }
}

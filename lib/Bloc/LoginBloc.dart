import 'dart:convert';

import 'package:kelompok_4/Helpers/Api.dart';
import 'package:kelompok_4/Helpers/ApiUrl.dart';
import 'package:kelompok_4/Model/Login.dart';

class LoginBloc {
  static Future<Login> login(
      {required String email, required String password}) async {
    String apiUrl = ApiUrl.login;

    var body = {
      "email": email,
      "password": password,
    };

    var response =
        await Api().post(apiUrl, body).then((res) => json.decode(res.body));
    return Login.fromJson(response);
  }
}

import 'dart:convert';

import 'package:kelompok_4/Helpers/Api.dart';
import 'package:kelompok_4/Helpers/ApiUrl.dart';
import 'package:kelompok_4/Model/Registrasi.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {required String name,
      required String email,
      required String password}) async {
    String apiUrl = ApiUrl.registrasi;

    var data = {
      "name": name,
      "email": email,
      "password": password,
    };

    var response =
        await Api().post(apiUrl, data).then((res) => json.decode(res.body));

    print(response);
    return Registrasi.fromJson(response);
  }
}

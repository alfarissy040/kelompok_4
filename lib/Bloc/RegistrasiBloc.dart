import 'dart:convert';

import 'package:kelompok_4/Helpers/Api.dart';
import 'package:kelompok_4/Helpers/ApiUrl.dart';
import 'package:kelompok_4/Model/Registrasi.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {required String nama,
      required String email,
      required String password}) async {
    String apiUrl = ApiUrl.registrasi;

    var body = json.encode({
      "nama": nama,
      "email": email,
      "password": password,
    });

    var response =
        await Api().post(apiUrl, body).then((res) => json.decode(res.body));
    return Registrasi.fromJson(response);
  }
}

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

    var body = {
      "nama": nama,
      "email": email,
      "password": password,
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Registrasi.fromJson(jsonObj);
  }
}

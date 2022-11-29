import 'dart:convert';

import 'package:kelompok_4/Helpers/Api.dart';
import 'package:kelompok_4/Helpers/ApiUrl.dart';
import 'package:kelompok_4/Model/Produk.dart';

class ProdukBloc {
  static Future<List<Produk>> getProduk() async {
    String apiUrl = ApiUrl.listProduk;
    var response = await Api().get(apiUrl).then((res) => json.decode(res.body));
    List<dynamic> listProduk = (response as Map<String, dynamic>)["data"];
    List<Produk> produks = [];

    for (int i = 0; i < listProduk.length; i++) {
      produks.add(Produk.fromJson(listProduk[i]));
    }
    return produks;
  }

  static Future addProduk({required Produk produk}) async {
    String apiUrl = ApiUrl.createProduk;

    var body = {
      "kodeProduk": produk.kodeProduk,
      "namaProduk": produk.namaProduk,
      "harga": produk.harga,
    };

    var response =
        await Api().post(apiUrl, body).then((res) => json.decode(res.body));
    return response["status"];
  }

  static Future<bool> updateProduk({required Produk produk}) async {
    String apiUrl = ApiUrl.updateProduk(produk.id);

    var body = {
      "kodeProduk": produk.kodeProduk,
      "namaProduk": produk.namaProduk,
      "harga": produk.harga,
    };

    var response =
        await Api().post(apiUrl, body).then((res) => json.decode(res.body));

    return response["data"];
  }

  static Future<bool> deleteProduk({required int id}) async {
    String apiUrl = ApiUrl.deleteProduk(id);

    var response =
        await Api().delete(apiUrl).then((res) => json.decode(res.body));

    return (response as Map<String, dynamic>)["data"];
  }
}

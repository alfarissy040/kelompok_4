import 'dart:convert';

import 'package:kelompok_4/Helpers/Api.dart';
import 'package:kelompok_4/Helpers/ApiUrl.dart';
import 'package:kelompok_4/Model/Produk.dart';

class ProdukBloc {
  static getProdukAll([int page = 1]) {
    String apiUrl = "${ApiUrl.listProduk}/?page=${page}";

    var response = Api()
        .get(apiUrl)
        .then((res) => json.decode(res.body))
        .then((val) => val["data"]["data"]);
    return response;
  }

  static showProduk(int id) {
    // Map<String, dynamic> data = {};
    String apiUrl = "${ApiUrl.listProduk}/${id}";

    var response = Api()
        .get(apiUrl)
        .then((res) => json.decode(res.body))
        .then((item) => item["data"]);
    return response;
  }

  static createProduk(Map<String, Object> data) async {
    String apiUrl = ApiUrl.createProduk;
    var response =
        await Api().post(apiUrl, data).then((res) => json.decode(res.body));
    return response["status"];
  }

  static updateProduk(Produk produk) async {
    String apiUrl = "${ApiUrl.updateProduk}/${produk.id}";
    var data = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.harga,
    };
    var response =
        await Api().put(apiUrl, data).then((res) => json.decode(res.body));
    return response["status"];
  }

  static deleteProduk(int id) async {
    String apiUrl = "${ApiUrl.updateProduk}/${id}";
    var response =
        await Api().delete(apiUrl).then((res) => json.decode(res.body));
    return response["status"];
  }

  // static Future addProduk({required Produk produk}) async {
  //   String apiUrl = ApiUrl.createProduk;

  //   var body = {
  //     "kodeProduk": produk.kodeProduk,
  //     "namaProduk": produk.namaProduk,
  //     "harga": produk.harga,
  //   };

  //   var response =
  //       await Api().post(apiUrl, body).then((res) => json.decode(res.body));
  //   return response["status"];
  // }

  // static Future<bool> updateProduk({required Produk produk}) async {
  //   String apiUrl = ApiUrl.updateProduk(produk.id!);

  //   var body = {
  //     "kodeProduk": produk.kodeProduk,
  //     "namaProduk": produk.namaProduk,
  //     "harga": produk.harga,
  //   };

  //   var response =
  //       await Api().post(apiUrl, body).then((res) => json.decode(res.body));

  //   return response["data"];
  // }

  // static Future<bool> deleteProduk({required int id}) async {
  //   String apiUrl = ApiUrl.deleteProduk(id);

  //   var response =
  //       await Api().delete(apiUrl).then((res) => json.decode(res.body));

  //   return (response as Map<String, dynamic>)["data"];
  // }
}

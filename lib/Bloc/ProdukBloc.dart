import 'dart:convert';
import 'dart:developer';

import 'package:kelompok_4/Helpers/Api.dart';
import 'package:kelompok_4/Helpers/ApiUrl.dart';
import 'package:kelompok_4/Model/Produk.dart';

class ProdukBloc {
  static getProdukAll() async {
    String apiUrl = ApiUrl.listProduk;
    var response = await Api().get(apiUrl).then((res) => json.decode(res.body));
    print("produk: ${response}");
    return response;
  }

  static showProduk(int id) async {
    String apiUrl = "${ApiUrl.listProduk}/${id}";
    var response = await Api().get(apiUrl).then((res) => json.decode(res.body));
    return response["data"];
  }

  static createProduk(Produk data) async {
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

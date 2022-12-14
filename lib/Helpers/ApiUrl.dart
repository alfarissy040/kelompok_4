import 'package:kelompok_4/Helpers/UserInfo.dart';

class ApiUrl {
  // static String baseUrl() {
  //   List<String> ip = [];
  //   UserInfo().getIp().then((value) {
  //     ip.clear();
  //     if (value != null) {
  //       return ip.add("$value/toko-api/public");
  //     }
  //     return ip.add("http://192.168.0.178:8081/toko-api/public");
  //   });
  //   print("ip : $ip");
  //   return ip[ip.length];
  // }
  static const String baseUrl = "http://192.168.0.178:8081/toko-api/public";

  static String registrasi = "$baseUrl/registrasi";
  static String login = "$baseUrl/login";
  static String listProduk = "$baseUrl/produk";
  static String createProduk = "$baseUrl/produk";

  static String updateProduk(int id) {
    var link = "$baseUrl/produk/$id";
    return link;
  }

  static String showProduk(String id) {
    return "$baseUrl/produk/$id";
  }

  static String deleteProduk(String id) {
    return "$baseUrl/produk/$id";
  }
}

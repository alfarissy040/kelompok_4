import 'dart:io';

import 'package:kelompok_4/Helpers/AppException.dart';
import 'package:kelompok_4/Helpers/UserInfo.dart';
import "package:http/http.dart" as http;

class Api {
  Future<dynamic> post(String link, dynamic data) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      var url = Uri.parse(link);
      final response = await http.post(
        url,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        body: data,
      );
      print(response);
      responseJson = ReturnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<dynamic> put(String link, dynamic data) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      var url = Uri.parse(link);
      final response = await http.put(url,
          body: data,
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      responseJson = ReturnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<dynamic> get(String url) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      responseJson = ReturnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.delete(Uri.parse(url),
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
      responseJson = ReturnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  dynamic ReturnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 422:
        throw InvalidInputException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error occured while Communication with server with status code: ${response.statusCode}");
    }
  }
}

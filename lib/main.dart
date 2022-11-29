import 'package:flutter/material.dart';
import 'package:kelompok_4/Helpers/UserInfo.dart';
import 'package:kelompok_4/Ui/LoginPage.dart';
import 'package:kelompok_4/Ui/ProdukPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token!.isNotEmpty) {
      setState(() {
        page = ProdukPage();
      });
    } else {
      setState(() {
        page = LoginPage();
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toko Kita",
      debugShowCheckedModeBanner: false,
      home: page,
    );
  }
}

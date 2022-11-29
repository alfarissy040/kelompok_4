import 'package:flutter/material.dart';
import 'package:kelompok_4/Ui/LoginPage.dart';
import 'package:kelompok_4/Ui/ProdukPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko kita',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: ProdukPage(),
    );
  }
}

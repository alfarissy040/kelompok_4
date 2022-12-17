import 'package:flutter/material.dart';
import 'package:kelompok_4/Bloc/ThemeManager.dart';
import './Helpers/UserInfo.dart';
import './Ui/LoginPage.dart';
import './Ui/ProdukPage.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());
  return runApp(ChangeNotifierProvider<ThemeManager>(
    create: (_) => ThemeManager(),
    child: MyApp(),
  ));
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
    if (token != null) {
      setState(() {
        page = ProdukPage();
      });
    } else {
      setState(() {
        page = LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder: (context, theme, child) => MaterialApp(
              theme: theme.getTheme(),
              title: "Toko Kita",
              debugShowCheckedModeBanner: false,
              home: page,
            ));
  }
}

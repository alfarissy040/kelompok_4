import 'package:flutter/material.dart';
import 'package:kelompok_4/Bloc/ThemeManager.dart';
import './Helpers/UserInfo.dart';
import './Ui/LoginPage.dart';
import './Ui/ProdukPage.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    return ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      builder: (context, child) {
        final provider = Provider.of<ThemeManager>(context);
        return MaterialApp(
          theme: provider.lightTheme,
          darkTheme: provider.darkTheme,
          themeMode: provider.themeMode,
          title: "Toko Kita",
          debugShowCheckedModeBanner: false,
          home: page,
        );
      },
    );
  }
}

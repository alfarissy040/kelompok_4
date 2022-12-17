import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelompok_4/Bloc/ThemeInfo.dart';
import 'package:kelompok_4/Bloc/ThemeManager.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  handleTheme() {
    String theme = ThemeInfo().getThemeInfo().toString();
    print("Setting theme: $theme");
    if (theme == "dark") {
      ThemeManager().setLightMode();
    } else {
      ThemeManager().setDarkMode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Setting")),
      body: SingleChildScrollView(
        child: ListView(
          children: [
            GestureDetector(
              child: const ListTile(
                title: Text("Dark Theme"),
              ),
              onTap: handleTheme,
            ),
            GestureDetector(
              child: const ListTile(
                title: Text("About"),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelompok_4/Bloc/ThemeInfo.dart';
import 'package:kelompok_4/Bloc/ThemeManager.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool switchStatus = false;

  @override
  void initState() {
    super.initState();
    checkTheme();
  }

  checkTheme() {
    ThemeInfo().getThemeInfo().then((value) {
      if (value == "dark") {
        setState(() {
          switchStatus = true;
        });
      } else {
        setState(() {
          switchStatus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeManager>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Setting")),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            GestureDetector(
              child: ListTile(
                title: const Text("Dark Theme"),
                trailing: Switch.adaptive(
                    value: provider.themeMode == ThemeMode.dark,
                    onChanged: (bool value) {
                      provider.toggleTheme(value);
                    }),
              ),
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

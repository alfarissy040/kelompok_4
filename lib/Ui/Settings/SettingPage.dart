import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kelompok_4/Components/SuccessDialog.dart';
import 'package:kelompok_4/Components/WarningDialog.dart';
import 'package:kelompok_4/Helpers/UserInfo.dart';

class SettingsIp extends StatefulWidget {
  const SettingsIp({super.key});

  @override
  State<SettingsIp> createState() => _SettingsIpState();
}

class _SettingsIpState extends State<SettingsIp> {
  final _ipController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting Ip"),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.fromLTRB(20, 12, 20, 12),
            child: Form(
              child: Column(children: [
                TextForm(
                  "Ip address",
                  _ipController,
                  TextInputType.url,
                  (value) => (value!.isEmpty ? "Ip Harus diisi" : null),
                ),
                SizedBox(
                  height: 12,
                ),
                BtnElevated("Simpan")
              ]),
            )),
      ),
    );
  }

  Widget TextForm(String label, controller, type, validator, [icon]) {
    return TextFormField(
        decoration: InputDecoration(labelText: label, prefixIcon: icon),
        keyboardType: type,
        controller: controller,
        validator: validator);
  }

  Widget BtnElevated(String label) {
    return ElevatedButton(
      child: Text(label),
      onPressed: () {
        var validate = _formKey.currentState?.validate();
        if (validate! & validate != null) {
          handleSubmit();
        }
      },
    );
  }

  void handleSubmit() {
    _formKey.currentState?.save();
    UserInfo().setIp(_ipController.text).then((res) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => SuccessDialog(
              msg: "Ip berhasil diubah",
              handleClick: () => Navigator.pop(context)));
    }, onError: (error) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              WarningDialog(msg: "Ip gagal diubah", handleClick: () {}));
    });
  }
}

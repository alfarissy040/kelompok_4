import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextForm("Nama", _namaController),
                  EmailForm("Email", _emailController),
                  PasswordForm("Password", _passwordController),
                  PasswordValidationForm(
                      "Konfirmasi Password", _passwordController),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: BtnElevated("Registrasi"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget TextForm(String label, controller) {
    return TextFormField(
        decoration: InputDecoration(labelText: label),
        keyboardType: TextInputType.text,
        controller: controller,
        validator: (value) => (value!.isEmpty && value.length < 3
            ? "Nama harus diisi minimal 3 karakter"
            : null));
  }

  Widget EmailForm(String label, controller) {
    return TextFormField(
        decoration: InputDecoration(labelText: label),
        keyboardType: TextInputType.text,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "Email tidak boleh kosong";
          }
          final bool regex = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value.toString());

          if (!regex) {
            return "Email tidak valid";
          }
        });
  }

  Widget PasswordForm(String label, controller) {
    return TextFormField(
        decoration: InputDecoration(labelText: label),
        keyboardType: TextInputType.text,
        obscureText: true,
        controller: controller,
        validator: (value) => (value!.isEmpty && value.length < 6
            ? "Password harus diisi minimal 6 karakter"
            : null));
  }

  Widget PasswordValidationForm(String label, validator) {
    return TextFormField(
        decoration: InputDecoration(labelText: label),
        keyboardType: TextInputType.text,
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty && value.length < 6) {
            return "Password harus diisi minimal 6 karakter";
          }
          if (value != validator.text) {
            return "Konfirmasi password tidak sama";
          }
        });
  }

  Widget BtnElevated(String label) {
    return ElevatedButton(
      child: Text(label),
      onPressed: () {
        var validate = _formKey.currentState?.validate();
      },
    );
  }
}

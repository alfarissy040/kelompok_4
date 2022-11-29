import 'package:flutter/material.dart';
import 'package:kelompok_4/Ui/RegistrasiPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EmailForm("Email", _emailController),
                    PasswordForm("Password", _passwordController),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          MenuNavigate("Register"),
                          Spacer(),
                          BtnElevated("Login", _formKey),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget EmailForm(String label, controller) {
    return TextFormField(
        decoration: InputDecoration(
          labelText: label,
        ),
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

  Widget BtnElevated(String label, state) {
    return ElevatedButton(
        child: Text(label),
        onPressed: () {
          var validate = state.currentState.validate();
        });
  }

  Widget MenuNavigate(String label) {
    return Container(
      child: Center(
        child: InkWell(
          child: Text(label, style: TextStyle(color: Colors.blue)),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => RegisterPage()));
          },
        ),
      ),
    );
  }
}

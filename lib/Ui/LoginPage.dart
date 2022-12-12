import 'package:flutter/material.dart';
import 'package:kelompok_4/Bloc/LoginBloc.dart';
import 'package:kelompok_4/Components/WarningDialog.dart';
import 'package:kelompok_4/Helpers/UserInfo.dart';
import 'package:kelompok_4/Ui/Development/SettingsIp.dart';
import 'package:kelompok_4/Ui/ProdukPage.dart';
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
      appBar: AppBar(
        title: Text("Login"),
        // debuggind purpose
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => SettingsIp()));
              },
              icon: const Icon(Icons.settings)),
        ],
        // end debuging purpose
      ),
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
                          BtnElevated("Login"),
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
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Colors.black54,
            )),
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
        decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(Icons.key),
            iconColor: Colors.black54),
        keyboardType: TextInputType.text,
        obscureText: true,
        controller: controller,
        validator: (value) => (value!.isEmpty & (value.length < 6)
            ? "Password harus diisi minimal 6 karakter"
            : null));
  }

  Widget BtnElevated(String label) {
    return ElevatedButton(
        child: Text(label),
        onPressed: () {
          var validate = _formKey.currentState?.validate();
          if (validate! & !_isLoading) {
            handleSubmit();
          }
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

  void handleSubmit() {
    _formKey.currentState?.save();
    setState(() {
      _isLoading = true;
    });
    LoginBloc.login(
            email: _emailController.text, password: _passwordController.text)
        .then((res) async {
      await UserInfo().setToken(res.token);
      await UserInfo().setUserId(res.userId);

      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => ProdukPage()));
    }, onError: (error) {
      print(error);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => WarningDialog(
              msg: "Login gagal, silahkan coba lagi", handleClick: () {}));
    });
    setState(() {
      _isLoading = false;
    });
  }
}

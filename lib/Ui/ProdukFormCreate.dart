import 'package:flutter/material.dart';
import 'package:kelompok_4/Model/Produk.dart';

class ProdukFormCreate extends StatefulWidget {
  @override
  State<ProdukFormCreate> createState() => _ProdukFormCreateState();
}

class _ProdukFormCreateState extends State<ProdukFormCreate> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Tambah Produk";
  String btnSubmit = "Simpan";

  final _kodeProdukController = TextEditingController();
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(
          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormInput("Kode Produk", _kodeProdukController,
                    "Kode produk harus diisi"),
                TextFormInput("Nama Produk", _namaProdukController,
                    "Nama produk harus diisi"),
                BtnValidated()
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget TextFormInput(String label, controller, String pesan) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.text,
      controller: controller,
      validator: (value) => value!.isEmpty ? pesan : null,
    );
  }

  Widget NumberFormInput(String label, controller, String pesan) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      controller: controller,
      validator: (value) => value!.isEmpty ? pesan : null,
    );
  }

  Widget BtnValidated() {
    return ElevatedButton(
      child: Text(btnSubmit),
      onPressed: () {
        var validate = _formKey.currentState?.validate();
      },
    );
  }
}

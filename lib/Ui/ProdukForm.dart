import 'package:flutter/material.dart';
import 'package:kelompok_4/Model/Produk.dart';

class ProdukForm extends StatefulWidget {
  Produk produk;
  ProdukForm({required this.produk});

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Tambah Produk";
  String btnSubmit = "Simpan";

  final _kodeProdukController = TextEditingController();
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "Ubah Produk";
        btnSubmit = "Edit";
        _kodeProdukController.text = widget.produk.kodeProduk;
        _namaProdukController.text = widget.produk.namaProduk;
        _hargaProdukController.text = widget.produk.harga.toString();
      });
    }
  }

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
      validator: (value) => value != null ? pesan : null,
    );
  }

  Widget NumberFormInput(String label, controller, String pesan) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      controller: controller,
      validator: (value) => value != null ? pesan : null,
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

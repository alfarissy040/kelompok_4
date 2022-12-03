import 'package:flutter/material.dart';
import 'package:kelompok_4/Bloc/ProdukBloc.dart';
import 'package:kelompok_4/Model/Produk.dart';
import 'package:kelompok_4/Ui/ProdukPage.dart';

class ProdukFormEdit extends StatefulWidget {
  int id;
  ProdukFormEdit({required this.id});

  @override
  State<ProdukFormEdit> createState() => _ProdukFormEditState();
}

class _ProdukFormEditState extends State<ProdukFormEdit> {
  Map data = {};

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "Ubah Produk";
  String btnSubmit = "Edit";

  final _kodeProdukController = TextEditingController();
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  void initState() {
    super.initState();
    data = ProdukBloc.showProduk(widget.id);
    setState(() {
      _kodeProdukController.text = data["kode_produk"];
      _namaProdukController.text = data["nama_produk"];
      _hargaProdukController.text = data["harga"].toString();
    });
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
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: BtnSubmit())
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

  Widget BtnSubmit() {
    return ElevatedButton(
      child: Text(btnSubmit),
      onPressed: () {
        var validate = _formKey.currentState?.validate();
        if (validate! && !_isLoading) {
          handleEdit();
        }
      },
    );
  }

  handleEdit() {
    setState(() {
      _isLoading = true;
    });
    Produk createProduk = new Produk(
        id: widget.id,
        kodeProduk: _kodeProdukController.text,
        namaProduk: _namaProdukController.text,
        harga: int.parse(_hargaProdukController.text));

    ProdukBloc.updateProduk(createProduk).then((value) {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => ProdukPage()));
    });
  }
}

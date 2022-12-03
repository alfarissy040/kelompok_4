import 'package:flutter/material.dart';
import 'package:kelompok_4/Bloc/ProdukBloc.dart';
import 'package:kelompok_4/Components/WarningDialog.dart';
import 'package:kelompok_4/Ui/ProdukFormCreate.dart';
import 'package:kelompok_4/Ui/ProdukFormEdit.dart';
import 'package:kelompok_4/Ui/ProdukPage.dart';

import '../Model/Produk.dart';

class ProdukDetail extends StatefulWidget {
  int id;
  ProdukDetail({required this.id});

  @override
  State<ProdukDetail> createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  Map<String, dynamic> data = {};
  _ProdukDetailState() {
    data = ProdukBloc.showProduk(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Produk"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Rp. ",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: BtnAction(),
          )
        ]),
      ),
    );
  }

  Widget BtnAction() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
            child: Text("Edit"),
            style: ElevatedButton.styleFrom(primary: Colors.teal),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => ProdukFormEdit(id: widget.id)));
            },
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 1,
          child: ElevatedButton(
              child: Text("Delete"),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () => confirmHapus()),
        )
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: Text("Yakin ingin menghapus data ini?"),
      actions: [
        ElevatedButton(
          onPressed: () {
            ProdukBloc.deleteProduk(widget.id).then((value) {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => ProdukPage()));
            }, onError: (error) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => WarningDialog(
                      msg: "Gagal menghapus data", handleClick: () {}));
            });
          },
          child: Text("Ya"),
          style: ElevatedButton.styleFrom(primary: Colors.teal),
        ),
        ElevatedButton(
            child: Text("Tidak"),
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () => Navigator.pop(context)),
      ],
    );
  }
}

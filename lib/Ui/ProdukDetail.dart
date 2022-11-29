import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kelompok_4/Ui/ProdukFormCreate.dart';
import 'package:kelompok_4/Ui/ProdukFormEdit.dart';

import '../Model/Produk.dart';

class ProdukDetail extends StatefulWidget {
  Produk produk;
  ProdukDetail({required this.produk});

  @override
  State<ProdukDetail> createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
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
              "${widget.produk.kodeProduk}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${widget.produk.namaProduk}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Rp. ${widget.produk.harga}",
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
                      builder: (context) =>
                          ProdukFormEdit(produk: widget.produk)));
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
}

void confirmHapus() {
  AlertDialog alertDialog = new AlertDialog(
    content: Text("Yakin ingin menghapus data ini?"),
    actions: [
      Container(
        color: Colors.blue,
        child: ElevatedButton(child: Text("Ya"), onPressed: () {}),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
        color: Colors.red,
        child: ElevatedButton(child: Text("Tidak"), onPressed: () {}),
      ),
    ],
  );
}

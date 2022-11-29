import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kelompok_4/Ui/ProdukForm.dart';

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
      body: Center(
        child: Column(children: [
          Text(
            "Kode : ${widget.produk.kodeProduk}",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Nama : ${widget.produk.namaProduk}",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            "Harga : Rp. ${widget.produk.harga}",
            style: TextStyle(fontSize: 18),
          ),
          BtnAction(),
        ]),
      ),
    );
  }

  Widget BtnAction() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.blue,
          child: ElevatedButton(
            child: Text("Edit"),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => ProdukForm(produk: widget.produk)));
            },
          ),
        ),
        Container(
          color: Colors.red,
          child: ElevatedButton(
              child: Text("Edit"), onPressed: () => confirmHapus()),
        ),
      ],
    );
  }
}

void confirmHapus() {
  AlertDialog alertDialog = AlertDialog(
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

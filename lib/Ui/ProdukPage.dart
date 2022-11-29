import 'package:flutter/material.dart';
import 'package:kelompok_4/Ui/ProdukDetail.dart';
import 'package:kelompok_4/Ui/ProdukForm.dart';

import '../Model/Produk.dart';

class ProdukPage extends StatefulWidget {
  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Produk"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              child: const Icon(Icons.add, size: 26),
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProdukForm()));
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Logout"),
              trailing: const Icon(Icons.logout),
              onTap: () async {},
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          ItemProduk(
            produk: Produk(
                id: 1,
                kodeProduk: "A001",
                namaProduk: "Kamera",
                harga: 5000000),
          ),
          ItemProduk(
            produk: Produk(
                id: 1,
                kodeProduk: "A002",
                namaProduk: "Kulkas",
                harga: 2500000),
          ),
          ItemProduk(
            produk: Produk(
                id: 1,
                kodeProduk: "A003",
                namaProduk: "Mesin Cuci",
                harga: 2000000),
          ),
        ],
      ),
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;
  ItemProduk({required this.produk});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => ProdukDetail(produk: produk)));
        },
        child: Card(
          child: ListTile(
            title: Text(produk.namaProduk),
            subtitle: Text(produk.harga.toString()),
          ),
        ),
      ),
    );
  }
}

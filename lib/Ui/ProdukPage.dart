import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kelompok_4/Bloc/LogoutBloc.dart';
import 'package:kelompok_4/Bloc/ProdukBloc.dart';
import 'package:kelompok_4/Ui/LoginPage.dart';
import 'package:kelompok_4/Ui/ProdukDetail.dart';
import 'package:kelompok_4/Ui/ProdukFormCreate.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../Model/Produk.dart';

class ProdukPage extends StatefulWidget {
  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  List data = [];
  Map test = {};

  refresh() {
    Map hasil;
    hasil = ProdukBloc.getProdukAll();
    print(hasil);
    log("getProduk : ${hasil}");
    data.addAll(hasil["data"]["data"]);
  }

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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProdukFormCreate()));
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
              onTap: () async {
                await LogoutBloc.logout().then((res) => {
                      Navigator.pushReplacement(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => LoginPage())),
                    });
              },
            )
          ],
        ),
      ),
      body: SmartRefresher(
        onRefresh: refresh,
        controller: _refreshController,
        child: ListView(
          children: [
            ListTile(
              title: Text("nama produk"),
              subtitle: Text("kode produk"),
              trailing: Text("harga"),
            )
          ],
        ),
      ),
    );
  }

  Widget ItemProduk(Map items) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      id: items["id"],
                    )));
      },
      child: ListTile(
        title: Text(items["namaProduk"]),
        subtitle: Text(items["kodeProduk"]),
        trailing: Text(items["harga"]),
      ),
    );
  }
}

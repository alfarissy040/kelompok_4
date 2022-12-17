import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelompok_4/Bloc/LogoutBloc.dart';
import 'package:kelompok_4/Bloc/ProdukBloc.dart';
import 'package:kelompok_4/Ui/LoginPage.dart';
import 'package:kelompok_4/Ui/ProdukDetail.dart';
import 'package:kelompok_4/Ui/ProdukFormCreate.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProdukPage extends StatefulWidget {
  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  ScrollController lazzyController = ScrollController();
  int limit = 25;
  List data = [];
  String ordeyRules = "kode_produk";

  refresh() async {
    await ProdukBloc.getProdukAll().then((items) => data = items);
    orderBy(ordeyRules);
  }

  orderBy(String rules) {
    data.sort((a, b) {
      var sorted = a[rules].compareTo(b[rules]);
      if (sorted != 0) return sorted;
      return a[rules].compareTo(b[rules]);
    });
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    lazzyController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    lazzyController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Produk"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  ordeyRules = "kode_produk";
                });
                orderBy(ordeyRules);
              },
              icon: const Icon(Icons.sort)),
          IconButton(
              onPressed: () {
                setState(() {
                  ordeyRules = "nama_produk";
                });
                orderBy(ordeyRules);
              },
              icon: const Icon(Icons.sort_by_alpha)),
          IconButton(
              onPressed: () {
                setState(() {
                  ordeyRules = "harga";
                });
                orderBy(ordeyRules);
              },
              icon: const Icon(Icons.attach_money)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProdukFormCreate()));
        },
        child: Icon(
          Icons.add,
          size: 24,
        ),
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
        enablePullDown: true,
        controller: _refreshController,
        child: ListView.builder(
            controller: lazzyController,
            itemCount: data.length > 0 ? limit : data.length,
            itemBuilder: (context, index) {
              if (index == data.length) {
                return CupertinoActivityIndicator();
              }
              return ItemProduk(data[index]);
            }),
      ),
    );
  }

  Widget ItemProduk(Map items, [int? index]) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProdukDetail(
                      id: items["id"],
                      kodeProduk: items["kode_produk"],
                      namaProduk: items["nama_produk"],
                      harga: items["harga"],
                    )));
      },
      child: ListTile(
        title: Text(items["nama_produk"]),
        subtitle: Text(items["kode_produk"]),
        // trailing: Text(index.toString()),
        trailing: Text(items["harga"].toString()),
      ),
    );
  }

  void _scrollListener() {
    if (lazzyController.position.extentAfter < 500) {
      setState(() {
        if ((limit + 25) >= data.length) {
          limit = data.length;
        } else {
          limit += 25;
        }
      });
    }
  }
}

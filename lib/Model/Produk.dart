class Produk {
  int? id;
  int harga;
  String kodeProduk;
  String namaProduk;

  Produk(
      {this.id,
      required this.kodeProduk,
      required this.namaProduk,
      required this.harga});

  factory Produk.fromJson(Map<String, dynamic> obj) {
    var data = Produk(
      id: obj["id"],
      kodeProduk: obj["kode_produk"],
      namaProduk: obj["nama_produk"],
      harga: obj["harga"],
    );
    print(data);
    return data;
  }
}

class Produk {
  int id, harga;
  String kodeProduk, namaProduk;

  Produk(
      {required this.id,
      required this.kodeProduk,
      required this.namaProduk,
      required this.harga});

  factory Produk.fromJson(Map<String, dynamic> obj) {
    return Produk(
      id: obj["id"],
      kodeProduk: obj["kode_produk"],
      namaProduk: obj["nama_produk"],
      harga: obj["harga"],
    );
  }
}

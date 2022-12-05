class Produk {
  int id;
  int harga;
  String kodeProduk;
  String namaProduk;

  Produk(
      {required this.id,
      required this.kodeProduk,
      required this.namaProduk,
      required this.harga});

  factory Produk.fromJson(Map<String, dynamic> item) {
    var data = Produk(
      id: item["id"],
      kodeProduk: item["kode_produk"],
      namaProduk: item["nama_produk"],
      harga: item["harga"],
    );
    return data;
  }
}

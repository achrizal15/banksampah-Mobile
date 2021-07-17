class Keranjang {
  int id;
 String  jumlah;
  String nama;
  String harga;
  String stock;
  String images;

  keranjangMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['jumlah'] = jumlah;
    mapping['nama'] = nama;
    mapping['harga'] = harga;
    mapping['stock'] = stock;
    mapping['images'] = images;
    return mapping;
  }
}

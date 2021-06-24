class Barang {
  String nama;
  int harga;

  Barang({this.nama, this.harga});
  static List<Barang> ambilBarang() {
    return <Barang>[
      Barang(
        nama: 'Botol',
        harga: 29332,
      ),
      Barang(
        nama: 'Kertas',
        harga: 37132,
      ),
      Barang(
        nama: 'Kecap',
        harga: 243232,
      ),
      Barang(
        nama: 'Kardus',
        harga: 4332,
      ),
      Barang(
        nama: 'Kadal',
        harga: 4332,
      ),
    ];
  }
}

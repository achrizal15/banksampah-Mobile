import 'package:financial_app/primaryButton.dart';
import 'package:flutter/material.dart';

class PenjualanHome extends StatefulWidget {
  @override
  _PenjualanHomeState createState() => _PenjualanHomeState();
}

class _PenjualanHomeState extends State<PenjualanHome> {
  List<Map<String, String>> barang = [
    {'Nama': 'Botol', 'Satuan': 'Kg', 'Harga': '20120'},
    {'Nama': 'Kadal', 'Satuan': 'Kg', 'Harga': '13220'},
    {'Nama': 'Kardus', 'Satuan': 'Kg', 'Harga': '4313'},
    {'Nama': 'Plastik', 'Satuan': 'Kg', 'Harga': '54223'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Daftar Barang',
            style: TextStyle(color: Colors.black),
          ),
          PrimaryButton(
            label: 'Penjemputan',
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Lakukan penjemputan?'),
                content: const Text(
                  'Dengan harga saat ini, jika setuju admin akan segera melakukan konfirmasi. Setelah itu notifikasi penjemputan akan muncul di profil anda',
                  textAlign: TextAlign.justify,
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batalkan',
                        style: TextStyle(color: Colors.red)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Setuju'),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            horizontalMargin: 10,
            columnSpacing: 35,
            columns: [
              DataColumn(label: Text('No'), numeric: true),
              DataColumn(label: Text('Jenis Barang')),
              DataColumn(label: Text('Satuan')),
              DataColumn(label: Text('Harga'))
            ],
            rows: List.generate(
                barang.length,
                (index) => DataRow(cells: [
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text(barang[index]['Nama'])),
                      DataCell(Text(barang[index]['Satuan'])),
                      DataCell(Text('Rp.' + barang[index]['Harga']))
                    ])),
          ),
        ),
      ),
    );
  }
}

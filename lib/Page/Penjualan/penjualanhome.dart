import 'dart:io';

import 'package:financial_app/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
            label: 'Jual Sampah',
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Upload Gambar Sampah'),
                content: InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: _image == null
                              ? NetworkImage(
                                  'https://infopublik.id/assets/upload/headline//48_20160414103535.jpg')
                              : FileImage(_image),
                          fit: BoxFit.cover),
                    ),
                    height: 200,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batalkan',
                        style: TextStyle(color: Colors.red)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      final snackBar = SnackBar(
                          content: Text(
                              'Upload berhasil, Silahkan tunggu penjemputan'));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Text('Jual'),
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

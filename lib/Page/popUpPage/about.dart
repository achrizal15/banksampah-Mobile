import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  final int about;

  const AboutPage({Key key, @required this.about}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        'About',
        style: GoogleFonts.aclonica(fontSize: 22),
      )),
      titlePadding: EdgeInsets.fromLTRB(0, 10, 0, 5),
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Close',
              style: TextStyle(color: Colors.red),
            ))
      ],
      content: Container(
          width: 300,
          height: 240,
          child: about == 1
              ? col1()
              : about == 2
                  ? col2()
                  : col3()),
    );
  }

  Column col1() {
    return Column(
      children: [
        ListTile(
          title: Text('1.Pilih icons paket di bawah layar'),
        ),
        ListTile(
          title: Text('2.Tekan tombol penjemputan'),
        ),
        ListTile(
          title: Text('3.Pilih setuju'),
        )
      ],
    );
  }

  Column col2() {
    return Column(
      children: [
        ListTile(
          title: Text('1.Pilih icons rekomendasi dibawah'),
        ),
        ListTile(
          title: Text('2.Pilih barang'),
        ),
        ListTile(
          title: Text('3.Tekan icons keranjang'),
        ),
        ListTile(
          title: Text('4.Checkout'),
        )
      ],
    );
  }

  Column col3() {
    return Column(
      children: [
        ListTile(
          title: Text('1.Masuk ke home page'),
        ),
        ListTile(
          title: Text('2.Pilih data yang akan dirubah'),
        ),
        ListTile(
          title: Text('3.Tekan icons checklist'),
        )
      ],
    );
  }
}

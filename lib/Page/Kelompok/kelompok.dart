import 'package:financial_app/Page/Kelompok/carikelompok.dart';
import 'package:flutter/material.dart';

class KelompokPage extends StatefulWidget {
  @override
  _KelompokPageState createState() => _KelompokPageState();
}

class _KelompokPageState extends State<KelompokPage> {
  final Color primaryColor = Color(0XFF00838F);
  final Color seconColor = Color(0XFF00B686);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 200,
          margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/image/group.png')),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Sepertinya kamu belum punya kelompok',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.grey[800]),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Yuk, cari kelompok terdekat',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.grey[800]),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                side:
                    MaterialStateProperty.all(BorderSide(color: primaryColor))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CariKelompokPage()));
            },
            child: Text(
              'Bergabung Sekarang',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: primaryColor),
            ))
      ],
    ));
  }
}

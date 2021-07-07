import 'package:flutter/material.dart';

class CariKelompokPage extends StatelessWidget {
  List kelompok = ['Ach Rizal', 'Rumah syaa', 'Rumah syaa', 'Rumah syaa'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Color(0XFF00838F),
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1 / 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih Kelompok',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Rekomendasi ditampikan berdasarkan yang terdekat',
                  style: TextStyle(),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.83,
            child: ListView.builder(
              itemCount: kelompok.length,
              itemBuilder: (BuildContext context, int index) => Container(
                child: ListTile(
                  title: Text(kelompok[index]),
                  tileColor: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

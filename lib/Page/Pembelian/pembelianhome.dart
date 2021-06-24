import 'package:financial_app/Page/Pembelian/drawer.dart';
import 'package:financial_app/Page/Pembelian/keranjang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class PembelianPageHome extends StatefulWidget {
  @override
  _PembelianPageHomeState createState() => _PembelianPageHomeState();
}

class _PembelianPageHomeState extends State<PembelianPageHome> {
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  final Color primaryColor = Color(0XFF00838F);
  final Color seconColor = Color(0XFF00B686);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      endDrawer: DrawerPage(),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0XFF00B686), Color(0XFF00838F)]),
            ),
          ),
          //  Product
          Align(
              child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: 10,
            padding: EdgeInsets.only(left: 10, right: 10),
            itemBuilder: (BuildContext context, int index) => index == 1
                // Unggulan
                ? Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 7),
                              color: Colors.black38,
                              blurRadius: 7)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                          child: Text(
                            'Unggulan',
                            style: GoogleFonts.aclonica(fontSize: 22),
                          ),
                        ),
                        Row(
                          children: [
                            buildUnggulan(
                                'Kreatif', 'assets/image/kreatif.png', true),
                            buildUnggulan(
                                'Kompos', 'assets/image/kompos.png', true),
                            buildUnggulan(
                                'Tagihan', 'assets/image/tagihan.png', false)
                          ],
                        )
                      ],
                    ),
                  )
                : index == 0
                    ? Container() //MARGIN TOP KONTAINER
                    : buildProduct(
                        'Kompos $index',
                        'https://akcdn.detik.net.id/visual/2020/10/19/ilustrasi-pupuk-kompos_169.jpeg?w=650',
                        'Rp.240.000',
                        index),
            staggeredTileBuilder: (int index) => index == 1
                ? StaggeredTile.count(4, 1.5)
                : index == 0
                    ? StaggeredTile.count(2, 2)
                    : StaggeredTile.count(2, 2.5),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          )),
          //  AppBar
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: EdgeInsets.only(top: 30),
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0XFF00B686), Color(0XFF00838F)]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Cari barang ',
                          hintStyle: TextStyle(fontSize: 15),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0XFF00838F),
                          ),
                          focusedBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KeranjangPage()));
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.category,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _scaffold.currentState.openEndDrawer();
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildUnggulan(String label, String img, bool none) {
    return Container(
      width: MediaQuery.of(context).size.width * 1 / 3.4,
      height: 80,
      decoration: BoxDecoration(
          border: Border(
              right: none ? BorderSide(color: Colors.grey) : BorderSide.none)),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 5),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.contain))),
          Text(label)
        ],
      ),
    );
  }

  Container buildProduct(String name, String img, String harga, int index) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(offset: Offset(1, 7), color: Colors.black38, blurRadius: 7)
      ]),
      child: Column(
        children: [
          Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.cover),
              )),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            child: Text(name),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  harga,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Beli',
                    style: TextStyle(color: Color(0XFF00838F)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

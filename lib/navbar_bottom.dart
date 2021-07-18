import 'package:financial_app/Page/Pembelian/pembelianhome.dart';
import 'package:financial_app/Page/Penjualan/penjualanhome.dart';
import 'package:financial_app/Page/home.dart';
import 'package:flutter/material.dart';

class Navbarbottom extends StatefulWidget {
  final int pageSelect;

  const Navbarbottom({Key key, this.pageSelect = 2}) : super(key: key);
  @override
  _NavbarbottomState createState() => _NavbarbottomState();
}

class _NavbarbottomState extends State<Navbarbottom> {
  int _selectedItemIndex;
  @override
  void initState() {
    super.initState();
    _selectedItemIndex = widget.pageSelect;
  }

  final List page = [PembelianPageHome(), PenjualanHome(), HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          buildNavBarItem(Icons.person, 2),
          buildNavBarItem(Icons.recommend, 0),
          buildNavBarItem(Icons.card_giftcard, 1),
        ],
      ),
      body: page[_selectedItemIndex],
    );
  }

  GestureDetector buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 1 / 3,
        height: 60,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 4, color: Colors.green)),
                gradient: LinearGradient(colors: [
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0.016),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? Color(0XFF00B868) : Colors.grey,
        ),
      ),
    );
  }
}

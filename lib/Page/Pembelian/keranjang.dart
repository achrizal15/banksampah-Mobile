import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeranjangPage extends StatefulWidget {
  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final Color primaryColor = Color(0XFF00838F);
  final Color seconColor = Color(0XFF00B686);
  int tes = 0;

  List<Map<String, String>> barang = [
    {'nama': 'Pulsa', 'harga': '20120', 'value': '0'},
    {'nama': 'Kompos', 'harga': '13220', 'value': '0'},
    {'nama': 'Karbit', 'harga': '4313', 'value': '0'},
    {'nama': 'Kadal', 'harga': '54223', 'value': '0'},
  ];
  bool kosong = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kosong == true ? primaryColor : Colors.grey[300],
      appBar: AppBar(
          title: InkWell(
              onTap: () {
                setState(() {
                  kosong = !kosong;
                });
              },
              child: Text('Keranjang Saya')),
          backgroundColor: primaryColor),
      body: kosong == true
          ? Column(
              children: [
                Container(
                  height: 200,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    image: DecorationImage(
                        image: AssetImage('assets/image/shoping.png')),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Wah, Keranjang belanjamu masih kosong',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.grey[100]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Yuk, Telusuri produk',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.grey[100]),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        side: MaterialStateProperty.all(
                            BorderSide(color: Colors.white))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Belanja Sekarang',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ))
              ],
            )
          : Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: GridView.builder(
                      itemCount: barang.length,
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 160,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (BuildContext context, int index) =>
                          BuildKeranjang(
                            name: barang[index]['nama'],
                            index: index,
                            img: 'assets/image/kompos1.jpg',
                            harga: barang[index]['harga'],
                          )),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(color: primaryColor, boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0, -1),
                          blurRadius: 25)
                    ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RichText(
                            text: TextSpan(
                                text: "Total",
                                style: TextStyle(color: seconColor),
                                children: [
                                  TextSpan(
                                      text: " Rp 200.500",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[100]))
                                ]),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(seconColor),
                              minimumSize:
                                  MaterialStateProperty.all(Size(150, 60))),
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[100]),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

class BuildKeranjang extends StatefulWidget {
  final int index;
  final String name;
  final String img;
  final String harga;

  const BuildKeranjang({
    Key key,
    this.index,
    this.name,
    this.img,
    this.harga,
  }) : super(key: key);

  @override
  _BuildKeranjangState createState() => _BuildKeranjangState();
}

class _BuildKeranjangState extends State<BuildKeranjang> {
  final Color primaryColor = Color(0XFF00838F);

  TextEditingController value = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.img), fit: BoxFit.cover)),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Product ' + widget.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Rp.${widget.harga}',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (int.parse(value.text) > 0) {
                            value.text = (int.parse(value.text) - 1).toString();
                          } else {
                            value.text = '0';
                          }
                        });
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      width: 80,
                      child: TextFormField(
                        controller: value,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (c) {
                          setState(() {
                            if (value.text == '') {
                              value.text = '0';
                            }
                          });
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+(?:\.\d+)?$')),
                        ],
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            value.text = (int.parse(value.text) + 1).toString();
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.green,
                        ))
                  ],
                ),
                Text('* Selain product online harus  \n   mengambil ke kantor')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

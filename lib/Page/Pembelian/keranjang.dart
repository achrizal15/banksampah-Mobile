import 'package:financial_app/Models/keranjang.dart';
import 'package:financial_app/Page/Pembelian/pembelianhome.dart';
import 'package:financial_app/Service/keranjang_service.dart';
import 'package:financial_app/navbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeranjangPage extends StatefulWidget {
  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final Color primaryColor = Color(0XFF00838F);
  final Color seconColor = Color(0XFF00B686);
  var _keranjang = Keranjang();
  var _keranjangService = KeranjangService();
  TextEditingController value;
  int jumlah = 1;
  var total;
  List item = [];

  @override
  void initState() {
    super.initState();
    getKeranjangData();
  }

  getKeranjangData() async {
    List<Map<String, dynamic>> ite = [];
    var keranjang = await _keranjangService.readKeranjang();
    keranjang.forEach((keranjang) {
      setState(() {
        ite.add({
          'nama': keranjang['nama'],
          'harga': keranjang['harga'],
          'stock': keranjang['stock'],
          'images': keranjang['images'],
          'jumlah': int.parse(keranjang['jumlah']),
        });
      });
    });

    List<dynamic> stackDuplicates(items) {
      Map<String, dynamic> uniqueItems = {};
      for (Map item in items) {
        final key = '${item["nama"]}-${item["harga"]}';
        (uniqueItems[key] == null)
            ? uniqueItems[key] = item
            : uniqueItems[key]['jumlah'] += item['jumlah'];
      }
      return uniqueItems.values.toList();
    }

    item = stackDuplicates(ite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.length == 0 ? primaryColor : Colors.grey[300],
      appBar: AppBar(
        title: Text('Keranjang Saya'),
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Navbarbottom(
                          pageSelect: 0,
                        )));
          },
        ),
      ),
      body: item.length == 0
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Navbarbottom(
                                    pageSelect: 0,
                                  )));
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
                    itemCount: item.length,
                    padding: EdgeInsets.only(bottom: 70),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisExtent: 160,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(item[index]['images']),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width *
                                      1 /
                                      1.8,
                                  child: Text(
                                    item[index]['nama'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  'Rp.' + item[index]['harga'],
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
                                          if (item[index]['jumlah'] <= 1) {
                                            item.removeAt(index);
                                            KeranjangService()
                                                .deleteKeranjang();
                                          } else {
                                            item[index]['jumlah'] =
                                                item[index]['jumlah'] - 1;
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
                                        controller: value =
                                            TextEditingController(
                                                text: item[index]['jumlah']
                                                    .toString()),
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        onChanged: (v) {
                                          setState(() {
                                            if (v == '') {
                                              item[index]['jumlah'] = 1;
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
                                            if (item[index]['jumlah'] <
                                                int.parse(
                                                    item[index]['stock'])) {
                                              item[index]['jumlah'] =
                                                  item[index]['jumlah'] + 1;
                                            } else {
                                              print('Kosong');
                                            }
                                          });
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.green,
                                        ))
                                  ],
                                ),
                                Text('STOCK : ' + item[index]['stock'])
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                                      text: "Rp." +
                                          item
                                              .map<int>((m) =>
                                                  int.parse(m['stock']) *
                                                  m["jumlah"])
                                              .reduce((a, b) => a + b)
                                              .toString(),
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

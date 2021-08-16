import 'package:financial_app/Models/Product.dart';
import 'package:financial_app/Models/keranjang.dart';
import 'package:financial_app/Page/Pembelian/drawer.dart';
import 'package:financial_app/Page/Pembelian/keranjang.dart';
import 'package:financial_app/Service/keranjang_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EtalaseProduct extends StatefulWidget {
  @override
  _EtalaseProductState createState() => _EtalaseProductState();
}

class _EtalaseProductState extends State<EtalaseProduct> {
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  final Color primaryColor = Color(0XFF00838F);
  final Color seconColor = Color(0XFF00B686);
  var _keranjang = Keranjang();
  var _keranjangService = KeranjangService();
  int jumlah;
  List<Product> filterData = [];
  List<Product> data = [];
  List<Keranjang> _keranjangList = List<Keranjang>.empty(growable: true);
  @override
  void initState() {
    super.initState();
    getKeranjangData();
    fetchProduct().then((user) {
      setState(() {
        filterData = user;
        data = filterData;
      });
    });
  }

  getKeranjangData() async {
    _keranjangList = List<Keranjang>.empty(growable: true);
    var keranjang = await _keranjangService.readKeranjang();
    keranjang.forEach((keranjang) {
      setState(() {
        var krModel = Keranjang();
        krModel.id = keranjang['id'];
        krModel.nama = keranjang['name'];
        krModel.harga = keranjang['price'];
        krModel.stock = keranjang['stock'];
        krModel.images = keranjang['picture'];
        _keranjangList.add(krModel);
      });
    });
  }

  void setCategory(category) {
    // setState(() {
    //   data = filterData
    //       .where((e) =>
    //           (e.category.toLowerCase().contains(category.toLowerCase())))
    //       .toList();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      endDrawer: DrawerPage(
        customCategory: setCategory,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Container(
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
                          autofocus: false,
                          onChanged: (v) {
                            setState(() {
                              // data = filterData
                              //     .where((e) => (e.title
                              //         .toLowerCase()
                              //         .contains(v.toLowerCase())))
                              //     .toList();
                            });
                          },
                          decoration: InputDecoration(
                              hintText: 'Cari barang',
                              hintStyle: TextStyle(fontSize: 15),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0XFF00838F),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              border: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      Stack(
                        children: [
                          IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KeranjangPage()));
                              }),
                          Positioned(
                            top: 3,
                            right: 3,
                            child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.red[500]),
                                child: Center(
                                    child: Text(
                                  _keranjangList.length.toString(),
                                  style: TextStyle(color: Colors.white),
                                ))),
                          ),
                        ],
                      ),
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
                hedingBuild()
              ],
            ),
          ),
          //  Product
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: Container(
                padding: EdgeInsets.only(top: 10),
                color: Colors.grey[100],
                child: filterData.length == 0
                    ? Center(
                        child: Container(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(),
                      ))
                    : data.length == 0
                        ? Center(
                            child: Text('Data tidak ditemukan...'),
                          )
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 2 / 2.5,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(1, 7),
                                          color: Colors.black38,
                                          blurRadius: 7)
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                data[index].picture),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        data[index].name,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Rp.' +
                                                data[index].price.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              _keranjang.nama =
                                                  data[index].name;
                                              _keranjang.images =
                                                  data[index].picture;
                                              _keranjang.harga =
                                                  data[index].price.toString();
                                              _keranjang.stock = '10';
                                              _keranjang.jumlah = '1';
                                              var a = await _keranjangService
                                                  .saveKeranjang(_keranjang);
                                              print(a);
                                              setState(() {
                                                getKeranjangData();
                                              });
                                            },
                                            child: Text(
                                              'Beli',
                                              style: TextStyle(
                                                  color: Color(0XFF00838F)),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            })),
          ),

          //  AppBar
        ],
      ),
    );
  }

  Container hedingBuild() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 7), color: Colors.black38, blurRadius: 7)
          ]),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Text(
              'Produk',
              style: GoogleFonts.aclonica(fontSize: 22),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildUnggulan('Kreatif', 'assets/image/kreatif.png', true),
              buildUnggulan('Kompos', 'assets/image/kompos.png', true),
              buildUnggulan('Tagihan', 'assets/image/tagihan.png', false)
            ],
          )
        ],
      ),
    );
  }

  Container buildUnggulan(String label, String img, bool none) {
    return Container(
      width: 100,
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
}

import 'package:financial_app/Login.dart';
import 'package:financial_app/Page/editprofile.dart';
import 'package:financial_app/Page/popUpPage/about.dart';
import 'package:financial_app/Page/popUpPage/notifikasi.dart';

import 'package:financial_app/Page/transaksi.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0XFF00B686), Color(0XFF00838F)]),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20.0, top: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Text(
                            "Available balance",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    NotifikasiPage()),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: Color(0XFF00B686),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 8,
                                    spreadRadius: 3)
                              ],
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            padding: EdgeInsets.all(5),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://infopublik.id/assets/upload/headline//48_20160414103535.jpg"),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ach Rizal",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.camera_front,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: "Rp.532",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: ".500",
                                              style: TextStyle(
                                                  color: Colors.white38))
                                        ]),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.grey.shade100,
                  child: ListView(
                    padding: EdgeInsets.only(top: 75),
                    children: [
                      Text(
                        "Activity",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildActivityButton(
                              Icons.perm_identity,
                              "Set Profile",
                              Colors.blue.withOpacity(0.2),
                              Color(0XFF01579B), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage()));
                          }),
                          buildActivityButton(
                              Icons.transfer_within_a_station,
                              "Transaksi",
                              Colors.cyanAccent.withOpacity(0.2),
                              Color(0XFF0097A7), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TransaksiPage(),
                                ));
                          }),
                          buildActivityButton(
                              Icons.logout,
                              "Logout",
                              Color(0XFFD7CCC8).withOpacity(0.4),
                              Colors.red.withOpacity(0.4), () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          }),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "About",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      buildAbout(
                        'Bagaimana cara menjual barang?',
                        () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AboutPage(
                                  about: 1,
                                )),
                      ),
                      buildAbout(
                        'Bagaimana cara membeli barang?',
                        () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AboutPage(
                            about: 2,
                          ),
                        ),
                      ),
                      buildAbout(
                        'Bagaimana cara merubah profil?',
                        () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AboutPage(
                            about: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 185,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 160,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 8,
                      spreadRadius: 3,
                      offset: Offset(0, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(50),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Income",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_upward,
                                color: Color(0XFF00838F),
                              )
                            ],
                          ),
                          Text(
                            "Rp.200.000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black87),
                          )
                        ],
                      ),
                      Container(width: 1, height: 50, color: Colors.grey),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Expenses",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.arrow_downward,
                                color: Color(0XFF00838F),
                              )
                            ],
                          ),
                          Text(
                            "Rp.232.322",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black87),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tabungan kamu bertambah Rp.1000 bulann ini",
                    style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Tampilkan Transaksi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF00B686)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildAbout(String title, Function onTap) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      height: 55,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              InkWell(
                child: Icon(Icons.navigate_next),
                onTap: onTap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildActivityButton(IconData icon, String title,
      Color backgroundColor, Color iconColor, Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

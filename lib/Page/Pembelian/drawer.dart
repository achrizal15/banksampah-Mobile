import 'package:financial_app/primaryButton.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 8),
                      color: Colors.black38,
                      blurRadius: 20)
                ],
                image: DecorationImage(
                  image: AssetImage('assets/image/daftar.png'),
                ),
                gradient: LinearGradient(
                    colors: [Color(0XFF00B686), Color(0XFF00838F)]),
              ),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Category',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.grey[100]),
                  )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 2 / 2.9,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ListView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) =>
                      index % 2 == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                PrimaryButton(
                                  onPressed: () {
                                    print(1);
                                  },
                                  label: 'Pulsa $index',
                                ),
                                PrimaryButton(
                                  onPressed: () {
                                    print(1);
                                  },
                                  label: 'Pulsa dan Tagihan',
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                PrimaryButton(
                                  onPressed: () {
                                    print(1);
                                  },
                                  label: 'Pulsa $index Kerajinan',
                                ),
                                PrimaryButton(
                                  onPressed: () {
                                    print(1);
                                  },
                                  label: 'Kompos ',
                                ),
                              ],
                            )),
            )
          ],
        ));
  }
}

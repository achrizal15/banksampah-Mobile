import 'package:financial_app/Models/http_products.dart';
import 'package:financial_app/primaryButton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  final customCategory;

  const DrawerPage({Key key, this.customCategory}) : super(key: key);
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  List _category = [];
  List<dynamic> data = [];
  @override
  void initState() {
    super.initState();
    fetchData().then((category) {
      setState(() {
        category.forEach((e) {
          data.add(e.category);
        });
        _category = data.toSet().toList();
      });
    });
  }

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
                child: _category.length == 0
                    ? Text('Loading...')
                    : Wrap(
                        spacing: 10,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          PrimaryButton(
                            onPressed: () {
                              widget.customCategory('');
                            },
                            label: 'All Product',
                          ),
                          for (var i = 0; i < _category.length; i++)
                            PrimaryButton(
                              onPressed: () {
                                widget.customCategory(_category[i]);
                              },
                              label: _category[i],
                            ),
                        ],
                      ))
          ],
        ));
  }
}

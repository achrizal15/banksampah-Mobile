import 'dart:io';
import 'package:financial_app/Login.dart';
import 'package:financial_app/navbar_bottom.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String internet = 'not connected';
  bool isLogin;
  @override
  void initState() {
    super.initState();
    userLogin();
  }

  userLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          internet = 'konek';
        });
      }
    } on SocketException catch (_) {
      setState(() {
        internet = 'not connected';
      });
    }

    setState(() {
      isLogin = pref.getBool('isLogin') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MerdekaApp',
      debugShowCheckedModeBanner: false,
      home: internet == 'not connected'
          ? Scaffold(
              body: Center(
                child: Container(
                  height: 100,
                  child: Column(
                    children: [
                      Text('Tidak ada internet coba restart aplikasi...'),
                      SizedBox(height: 50),
                      Container(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : isLogin != true
              ? Login()
              : Navbarbottom(),
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
    );
  }
}

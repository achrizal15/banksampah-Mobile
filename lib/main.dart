import 'package:financial_app/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MerdekaApp',
      debugShowCheckedModeBanner: false,
      home: Login(),
      theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
    );
  }
}

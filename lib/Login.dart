import 'package:financial_app/daftar.dart';
import 'package:financial_app/navbar_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();
  bool _obs = true;
  TextEditingController pass = TextEditingController();
  TextEditingController nik = TextEditingController();
  // int _nik;
  // String _pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
                height: 260,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ],
                    gradient: LinearGradient(
                        colors: [Color(0XFF00B686), Color(0XFF00838F)]),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100))),
                child: Stack(
                  children: [
                    Positioned(
                      top: -20,
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/image/lampu.png'))),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      bottom: 0,
                      left: 60,
                      child: Container(
                        width: 240,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/login.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 20,
                        top: 220,
                        child: Text('Pilah Sampah Jadi Uang',
                            style: GoogleFonts.robotoMono(
                                color: Colors.yellow,
                                shadows: [
                                  Shadow(
                                      blurRadius: 8.0,
                                      offset: Offset(3, 4),
                                      color: Colors.grey[700])
                                ],
                                fontSize: 24,
                                fontWeight: FontWeight.bold))),
                  ],
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 60, 50, 0),
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                      buildForm('NIK', TextInputType.number, Icons.person,
                          false, false, nik),
                      SizedBox(
                        height: 20,
                      ),
                      buildForm('Password', TextInputType.text, Icons.vpn_key,
                          _obs, true, pass),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                shadowColor:
                                    MaterialStateProperty.all(Colors.grey),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0XFF00838F))),
                            onPressed: () {
                              if (_key.currentState.validate()) {
                                print(nik.text + pass.text);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Navbarbottom()),
                                );
                              }
                            },
                            child: Text('Login')),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Belum memiliki akun?'),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DaftarPage()));
                        },
                        child: Text(
                          'Daftar',
                          style: TextStyle(color: Color(0XFF00838F)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Container buildForm(String hint, TextInputType typeText, IconData icon,
      bool obscure, bool visibility, TextEditingController _inputText) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
        BoxShadow(blurRadius: 25, offset: Offset(0, 3), color: Colors.grey)
      ]),
      child: TextFormField(
        obscureText: obscure,
        cursorColor: Color(0XFF00838F),
        controller: _inputText,
        keyboardType: typeText,
        validator: (value) => value.isEmpty ? '$hint Is Empty ' : null,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              icon,
              color: Color(0XFF00838F),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            hintText: hint,
            prefixText: ': ',
            prefixStyle: TextStyle(fontSize: 20),
            suffixIcon: visibility
                ? IconButton(
                    icon: obscure
                        ? Icon(
                            Icons.visibility,
                            color: Color(0XFF00838F),
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.grey[400],
                          ),
                    onPressed: () {
                      setState(() {
                        _obs = !_obs;
                      });
                    },
                  )
                : null),
      ),
    );
  }
}

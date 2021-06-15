import 'dart:io';

import 'package:financial_app/Login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class DaftarPage extends StatefulWidget {
  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {
  final _key = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nomer = TextEditingController();

  final format = DateFormat("yyyy-MM-dd");
  // Dropdown
  List gender = ['Pria', 'Wanita'];
  String _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1 / 3,
            child: Stack(
              children: [
                Positioned(
                  right: 20,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/sun.png'))),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 15,
                  child: Text('Halo kawan, \nkenalan dulu yuk',
                      style: GoogleFonts.roboto(fontSize: 25)),
                ),
                Positioned(
                  top: 105,
                  left: 10,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/daftar.png'))),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  buildForm('Nama', 'Namanya siapa?', TextInputType.name, nama),
                  buildForm('Alamat', 'Alamatnya dimana?',
                      TextInputType.streetAddress, alamat),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[700]))),
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          items: gender.map((e) {
                            return DropdownMenuItem(
                              child: Text(
                                e,
                                style: TextStyle(fontSize: 20),
                              ),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                          value: _gender,
                          hint: Text(
                            'Gender',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: DateTimeField(
                          format: format,
                          style: TextStyle(fontSize: 20),
                          decoration:
                              InputDecoration(labelText: 'Lahir kapan?'),
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime.now());
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: buildForm(
                              'Telepon', 'No.Hp', TextInputType.phone, nomer)),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: buildForm('Email', 'Email',
                              TextInputType.emailAddress, email))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            'Batalkan',
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DaftarPage2()));
                          },
                          child: Text(
                            'Lanjutkan',
                            style: TextStyle(fontSize: 15, color: Colors.blue),
                          )),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildForm(String name, String label, TextInputType typeInput,
      TextEditingController _control) {
    return Container(
      child: TextFormField(
        style: TextStyle(fontSize: 20),
        controller: _control,
        keyboardType: typeInput,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}

class DaftarPage2 extends StatefulWidget {
  @override
  _DaftarPage2State createState() => _DaftarPage2State();
}

class _DaftarPage2State extends State<DaftarPage2> {
  final _key = GlobalKey<FormState>();
  TextEditingController nik = TextEditingController();
  TextEditingController password = TextEditingController();
  List keanggotaan = ['Solo', 'Kelompok'];
  String _keanggotaan;
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1 / 3,
            child: Stack(
              children: [
                Positioned(
                  right: 20,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/sun.png'))),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 15,
                  child: Text('Yey, \nSatu langkah lagi',
                      style: GoogleFonts.roboto(fontSize: 25)),
                ),
                Positioned(
                  top: 105,
                  left: 10,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/image/daftar.png'))),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  buildForm('NIK', 'NIK', TextInputType.number, nik),
                  buildForm(
                      'Password', 'Buat Password', TextInputType.number, nik),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[700]))),
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          items: keanggotaan.map((e) {
                            return DropdownMenuItem(
                              child: Text(
                                e,
                                style: TextStyle(fontSize: 20),
                              ),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _keanggotaan = value;
                            });
                          },
                          value: _keanggotaan,
                          hint: Text(
                            'Keanggotaan',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[700]))),
                        child: TextButton(
                          onPressed: getImage,
                          child: Text(
                            _image != null ? 'Berhasil' : 'Upload KTP',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildForm(String name, String label, TextInputType typeInput,
      TextEditingController _control) {
    return Container(
      child: TextFormField(
        style: TextStyle(fontSize: 20),
        controller: _control,
        keyboardType: typeInput,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}

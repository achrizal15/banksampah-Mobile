import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:financial_app/Login.dart';
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
  TextEditingController umur = TextEditingController();

  final format = DateFormat("yyyy-MM-dd");
  // Dropdown
  List gender = ['Pria', 'Wanita'];
  String _gender;
  String genderValidator;
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
                  buildForm(
                      'Nama', 'Namanya siapa?', TextInputType.name, nama, true),
                  buildForm('Alamat', 'Alamatnya dimana?',
                      TextInputType.streetAddress, alamat, true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: (genderValidator == null
                                            ? Colors.grey[700]
                                            : Colors.red)))),
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
                          genderValidator != null
                              ? Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Pilih Salah Satu',
                                    style: TextStyle(
                                        color: Colors.red[700], fontSize: 12),
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: DateTimeField(
                          format: format,
                          validator: (value) =>
                              value == null ? 'Umur Is Empty ' : null,
                          controller: umur,
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
                          child: buildForm('Telepon', 'No.Hp',
                              TextInputType.phone, nomer, true)),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: buildForm('Email', 'Email(Optional)',
                              TextInputType.emailAddress, email, false))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
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
                            if (_key.currentState.validate() &&
                                _gender != null) {
                              print(nama.text +
                                  alamat.text +
                                  nomer.text +
                                  email.text +
                                  _gender +
                                  umur.text);
                              setState(() {
                                genderValidator = null;
                              });

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DaftarPage2(
                                            nama: nama.text,
                                            alamat: alamat.text,
                                            gender: _gender,
                                            umur: umur.text,
                                            nomor: nomer.text,
                                            email: email.text,
                                          )));
                            } else {
                              setState(() {
                                genderValidator = 'active';
                              });
                            }
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
      TextEditingController _control, bool validator) {
    return Container(
      child: TextFormField(
        style: TextStyle(fontSize: 20),
        textCapitalization: TextCapitalization.words,
        autofocus: true,
        validator: validator
            ? (value) => value.isEmpty ? '$name Is Empty ' : null
            : null,
        controller: _control,
        keyboardType: typeInput,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}

class DaftarPage2 extends StatefulWidget {
  final String nama;
  final String alamat;
  final String gender;
  final String umur;
  final String email;
  final String nomor;

  const DaftarPage2(
      {Key key,
      this.nama,
      this.alamat,
      this.gender,
      this.umur,
      this.email,
      this.nomor})
      : super(key: key);

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

  String anggotaValidator;
  String ktpValidator;
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
                  top: 55,
                  left: 15,
                  child: Text('Halo,\n${widget.nama}, \nSatu langkah lagi',
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
                  buildForm('NIK', 'NIK', TextInputType.number, nik, true,
                      'Nik tidak boleh kosong'),
                  buildForm('Password', 'Buat Password', TextInputType.text,
                      password, true, 'Password terlalu pendek min 4'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: (anggotaValidator == null
                                            ? Colors.grey[700]
                                            : Colors.red)))),
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
                          anggotaValidator != null
                              ? Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Pilih Salah Satu',
                                    style: TextStyle(
                                        color: Colors.red[700], fontSize: 12),
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: (ktpValidator == null
                                            ? Colors.grey[700]
                                            : Colors.red)))),
                            child: TextButton(
                              onPressed: getImage,
                              child: Text(
                                _image != null ? 'Berhasil' : 'Upload KTP',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                            ),
                          ),
                          ktpValidator != null
                              ? Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Upload ktpnya dulu',
                                    style: TextStyle(
                                        color: Colors.red[700], fontSize: 12),
                                  ),
                                )
                              : SizedBox()
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Kembali',
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          )),
                      TextButton(
                          onPressed: () {
                            if (_key.currentState.validate() &&
                                _keanggotaan != null &&
                                _image != null) {
                              print(password.text);
                              setState(() {
                                anggotaValidator = null;
                                ktpValidator = null;
                              });
                            } else {
                              setState(() {
                                anggotaValidator = 'active';
                                ktpValidator = 'active';
                              });
                            }
                          },
                          child: Text(
                            'Daftar',
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
      TextEditingController _control, bool validator, String val) {
    return Container(
      child: TextFormField(
        style: TextStyle(fontSize: 20),
        autofocus: true,
        validator: validator
            ? name == 'Password'
                ? (value) => value.length < 4 ? '$val' : null
                : (value) => value.isEmpty ? '$val' : null
            : null,
        controller: _control,
        keyboardType: typeInput,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}

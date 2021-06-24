import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final format = DateFormat("yyyy-MM-dd");
  TextEditingController nama = TextEditingController();
  // KeyBoard
  bool isKeyboard() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

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
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: Icon(Icons.check, color: Color(0XFF00B686)),
              onPressed: () {})
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0XFF00B686)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Ubah Profil',
          style: TextStyle(color: Colors.black),
        ),
      ),
      // Nama,Alamat,umur,gender,nohp,email,nik,keanggotaan,password
      body: Column(
        children: [
          isKeyboard()
              ? SizedBox(
                  height: 0,
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0XFF00B686), Color(0XFF00838F)]),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: getImage,
                      child: Container(
                        height: 130,
                        width: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: _image == null
                                    ? NetworkImage(
                                        'https://infopublik.id/assets/upload/headline//48_20160414103535.jpg')
                                    : FileImage(_image),
                                fit: BoxFit.cover)),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.black38),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 30,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    backgroundBlendMode: BlendMode.darken,
                                    color: Colors.black38),
                                child: Center(
                                    child: Text(
                                  'Tekan untuk Ubah',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
          Container(
            height: MediaQuery.of(context).size.height * 1 / 1.7,
            child: Column(
              children: [
                editBarNumber('NIK', '238291223'),
                editBarText('Nama', 'Slamet Yudi', nama, false),
                editBarText('Alamat', 'Banyuwangi,Glagah', nama, false),
                editBarText('Email', 'achrizal15@gmail.com', nama, false),
                editBarNumber('No.Hp', '082291223'),
                editBarDate(),
                editBarAlert('Jenis Kelamin', 'Pria', 'Wanita'),
                SizedBox(height: 20),
                editBarAlert('Keanggotaan', 'Umum', 'Kelompok'),
                SizedBox(height: 20),
                editBarText('Password', 'Ubah sekarang', nama, true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container editBarAlert(String title1, String opsi, String opsi2) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey[300]))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title1),
          Container(
              width: MediaQuery.of(context).size.width * 1 / 2,
              child: TextButton(
                  style: ButtonStyle(alignment: Alignment.centerRight),
                  onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Center(
                              child: Text(
                            title1,
                          )),
                          titlePadding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                          content: Container(
                            height: 120,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {},
                                  title: Text(opsi),
                                ),
                                ListTile(
                                  onTap: () {},
                                  title: Text(opsi2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  child: Text(
                    opsi,
                    style: TextStyle(color: Colors.grey[600]),
                  )))
        ],
      ),
    );
  }

  Container editBarDate() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey[300]))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Tanggal Lahir'),
          Container(
            width: MediaQuery.of(context).size.width * 1 / 2,
            child: DateTimeField(
              format: format,
              initialValue: DateTime(2000, 06, 06),
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.right,
              resetIcon: null,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(borderSide: BorderSide.none)),
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime(2015, 01, 01),
                    lastDate: DateTime(2015, 01, 01));
              },
            ),
          )
        ],
      ),
    );
  }

  Container editBarNumber(String name, String initialValue) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey[300]))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Container(
              width: MediaQuery.of(context).size.width * 1 / 2,
              child: TextFormField(
                initialValue: initialValue,
                textAlign: TextAlign.end,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.grey[600]),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+(?:\.\d+)?$')),
                ],
                decoration: InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none)),
              ))
        ],
      ),
    );
  }

  Container editBarText(String name, String value,
      TextEditingController controler, bool navigasi) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey[300]))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          navigasi == true
              ? Container(
                  width: MediaQuery.of(context).size.width * 1 / 2,
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePassword()));
                    },
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                )
              : Container(
                  width: MediaQuery.of(context).size.width * 1 / 2,
                  child: TextFormField(
                    onChanged: (v) {
                      print(v);
                    },
                    textAlign: TextAlign.end,
                    initialValue: value,
                    style: TextStyle(color: Colors.grey[600]),
                    decoration: InputDecoration(
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none)),
                  ),
                )
        ],
      ),
    );
  }
}

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0XFF00B686)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Atur Password',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(25, 40, 25, 0),
        child: ListView(
          children: [
            Text(
              'Untuk mengamankan akunmu silahkan verifikasi identitas dengan memasukkan password',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextFormField(
              cursorColor: Color(0XFF00B686),
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Password saat ini',
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF00B686))),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              cursorColor: Color(0XFF00B686),
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Password baru',
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF00B686))),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              cursorColor: Color(0XFF00B686),
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                hintText: 'Konfirmasi password baru',
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF00B686))),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0XFF00B686))),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('ATUR ULANG', style: TextStyle(fontSize: 17)))
          ],
        ),
      ),
    );
  }
}

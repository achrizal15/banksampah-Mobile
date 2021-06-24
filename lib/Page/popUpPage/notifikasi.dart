import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifikasiPage extends StatefulWidget {
  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  bool notif = true;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: InkWell(
        onTap: () {
          setState(() {
            notif = !notif;
          });
        },
        child: Text(
          'Notifikasi',
          style: GoogleFonts.aclonica(fontSize: 22),
        ),
      )),
      titlePadding: EdgeInsets.fromLTRB(0, 10, 0, 5),
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Close',
              style: TextStyle(color: Colors.red),
            ))
      ],
      content: notif == false
          ? Container(
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/image/lonceng.png'),
              )),
            )
          : Container(
              height: 150,
              width: 350,
              child: ListView(
                children: [
                  ListTile(
                    subtitle: Text('12-12-2021'),
                    leading: Text('Admin'),
                    title: Text('Penjemputan telah dikonfirmasi'),
                  )
                ],
              ),
            ),
    );
  }
}

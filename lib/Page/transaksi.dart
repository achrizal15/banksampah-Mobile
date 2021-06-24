import 'package:flutter/material.dart';
import 'package:financial_app/Page/statis.dart';
import 'package:data_table_2/data_table_2.dart';

class TransaksiPage extends StatefulWidget {
  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  List<Map<String, String>> barang = [
    {'tanggal': '12/12/2021', 'type': 'Pembelian', 'nominal': '20120'},
    {'tanggal': '02/03/2021', 'type': 'Pengeluaran', 'nominal': '13220'},
    {'tanggal': '01/02/2021', 'type': 'Pengeluaran', 'nominal': '4313'},
    {'tanggal': '05/12/2021', 'type': 'Pembelian', 'nominal': '54223'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.stacked_bar_chart, color: Color(0XFF00B686)),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Center(
                    child: Text(
                  'Statistik',
                )),
                titlePadding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                content: Container(height: 300, child: ChartTestPage()),
              ),
            ),
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0XFF00B686)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Transaksi',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable2(
            horizontalMargin: 20,
            dataRowHeight: 30,
            headingTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                fontStyle: FontStyle.italic),
            columnSpacing: 12,
            minWidth: 10,
            headingRowColor: MaterialStateProperty.all(Colors.grey[700]),
            columns: [
              DataColumn2(label: Text('No'), size: ColumnSize.S),
              DataColumn2(label: Text('Tanggal'), size: ColumnSize.L),
              DataColumn2(label: Text('Type'), size: ColumnSize.L),
              DataColumn2(label: Text('Nominal'), size: ColumnSize.L)
            ],
            rows: List.generate(
                barang.length,
                (index) => DataRow(cells: [
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text(barang[index]['tanggal'])),
                      DataCell(Text(barang[index]['type'])),
                      DataCell(Text('Rp.' + barang[index]['nominal']))
                    ])),
          ),
        ),
      ),
    );
  }
}

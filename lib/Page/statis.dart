import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartTestPage extends StatelessWidget {
  const ChartTestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _simpleBar();
  }

  Widget _simpleBar() {
    var random = Random();
    var data = [
      OrdinalSales('Senin', random.nextInt(100)),
      OrdinalSales('Selasa', random.nextInt(100)),
      OrdinalSales('Rabu', random.nextInt(100)),
      OrdinalSales('Kamis', random.nextInt(100)),
      OrdinalSales('Jumat', random.nextInt(100)),
    ];
    var data1 = [
      OrdinalSales('Senin', random.nextInt(100)),
      OrdinalSales('Selasa', random.nextInt(100)),
      OrdinalSales('Rabu', random.nextInt(100)),
      OrdinalSales('Kamis', random.nextInt(100)),
      OrdinalSales('Jumat', 100),
    ];

    var seriesList = [
      charts.Series<OrdinalSales, String>(
        id: 'Penjemputan',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        labelAccessorFn: (OrdinalSales sales, _) =>
            ('${sales.sales}'.toString()),
        data: data,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Pembelian',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        labelAccessorFn: (OrdinalSales sales, _) =>
            ('${sales.sales}'.toString()),
        data: data1,
      )
    ];

    return charts.BarChart(
      seriesList,
      animate: true,
      behaviors: [new charts.SeriesLegend()],
      barRendererDecorator: charts.BarLabelDecorator<String>(),
    );
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

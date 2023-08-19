import 'package:flutter/material.dart';
import '../data/model/add_date.dart';
import '../data/utlity.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class Chart extends StatelessWidget {
  int indexx;
  Chart({Key? key, required this.indexx}) : super(key: key);

  List<Add_data>? a;

  bool b = true;

  bool j = true;

  @override
  Widget build(BuildContext context) {
    switch (indexx) {
      case 0:
        a = today().cast<Add_data>();
        b = true;
        j = true;
        break;
      case 1:
        a = week().cast<Add_data>();
        b = false;
        j = true;
        break;
      case 2:
        a = month().cast<Add_data>();
        b = false;
        j = true;
        break;
      case 3:
        a = year().cast<Add_data>();

        j = false;
        break;
      default:
    }
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: const Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: <SalesData>[
              ...List.generate(time(a!, b ? true : false).length, (index) {
                return SalesData(
                    j
                        ? b
                            ? a![index].datetime.hour.toString()
                            : a![index].datetime.day.toString()
                        : a![index].datetime.month.toString(),
                    b
                        ? index > 0
                            ? time(a!, true)[index] + time(a!, true)[index - 1]
                            : time(a!, true)[index]
                        : index > 0
                            ? time(a!, false)[index] +
                                time(a!, false)[index - 1]
                            : time(a!, false)[index]);
              })
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          )
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}

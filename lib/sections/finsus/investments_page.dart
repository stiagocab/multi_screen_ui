import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class InvesmentsPage extends StatelessWidget {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.width * 0.1,
            bottom: MediaQuery.of(context).size.width * 0.1),
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30.0),
                child: PieChart(
                  key: ValueKey(key),
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 800),
                  // chartLegendSpacing: _chartLegendSpacing!,
                  // chartRadius: MediaQuery.of(context).size.width / 3.2 > 300
                  //     ? 300
                  //     : MediaQuery.of(context).size.width / 3.2,
                  colorList: colorList,
                  // initialAngleInDegree: 0,
                  // legendOptions: ,
                  chartType: ChartType.ring,
                  // centerText: _showCenterText ? "HYBRID" : null,
                  legendOptions: LegendOptions(
                    showLegendsInRow: true,
                    legendPosition: LegendPosition.bottom,
                    showLegends: false,
                    // legendShape: BoxShape.rectangle,
                    legendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  chartValuesOptions: ChartValuesOptions(
                    // showChartValueBackground: true,
                    showChartValues: false,
                    // showChartValuesInPercentage: true,
                    // showChartValuesOutside: _showChartValuesOutside,
                  ),
                  ringStrokeWidth: 40.0,
                  // emptyColor: Colors.grey,
                ),
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:multi_ui/sections/finsus/finsus_data.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:multi_ui/sections/finsus/widgets.dart';

class InvesmentsPage extends StatefulWidget {
  @override
  _InvesmentsPageState createState() => _InvesmentsPageState();
}

class _InvesmentsPageState extends State<InvesmentsPage> {
  List<InvesmentModel> invesmentsDataList = [];
  Map<String, double> investmentsDataMap = {};

  final List<Color> colorList = [
    Colors.blueGrey,
    Colors.blueAccent,
    Colors.blue,
    Colors.blueGrey[100],
    Colors.blueAccent[100],
    Colors.blue[100],
    Colors.blueGrey[200],
    Colors.blueAccent[200],
    Colors.blue[200]
  ];

  @override
  void initState() {
    super.initState();

    final Invesments investmensFromData = Invesments.fromJsonList(investments);

    // MAP {invesmentName: value};

    final investmentMap = investmensFromData.dataMap;
    var mapEntries = investmentMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    investmentMap
      ..clear()
      ..addEntries(mapEntries);

    //

    final invesmentsList = investmensFromData.list;
    invesmentsList.sort((a, b) => b.value.compareTo(a.value));

    setState(() {
      investmentsDataMap = investmentMap;
      invesmentsDataList = investmensFromData.list;
    });
  }

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
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  // PIE CHART
                  renderPieChart()
                ]),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final itemInvesment = invesmentsDataList[index];
                    return buildInvestWidget(itemInvesment, index + 1);
                  },
                  childCount: invesmentsDataList.length,
                ),
              )
            ],
          ),
        ));
  }

  Widget buildInvestWidget([InvesmentModel item, int index]) {
    final TextStyle subtitleStyle =
        TextStyle(fontSize: 11.5, color: finsusColor);
    final TextStyle titleStyle = TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.black54);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // margin: EdgeInsets.only(bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(4),
          // border: Border.all(
          //   width: 3.0,
          //   color: colorList[colorList.length % index],
          // ),
        ),
        child: ListTile(
          // contentPadding: EdgeInsets.all(5),
          title: Text(
            item.name,
            style: titleStyle,
          ),
          subtitle: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${item.expirationTime} días", style: subtitleStyle),
                Text("${(item.interestRate * 100).toStringAsFixed(2)}%",
                    style: subtitleStyle),
                Text("${hideShowValue(item.value, true)}",
                    style: subtitleStyle),
              ],
            ),
          ),
          // leading: Icon(
          //   Icons.donut_small_rounded,
          //   color: colorList[colorList.length % index],
          //   size: 20.0,
          // ),
          trailing: Icon(
            Icons.album_sharp,
            color: colorList[colorList.length % index],
            size: 20.0,
          ),
        ),
      ),
    );
  }

  Widget renderPieChart() {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: PieChart(
        dataMap: investmentsDataMap,
        animationDuration: Duration(milliseconds: 800),
        colorList: colorList,
        chartType: ChartType.ring,
        legendOptions: LegendOptions(
          showLegendsInRow: true,
          legendPosition: LegendPosition.bottom,
          showLegends: false,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValues: true,
          showChartValuesInPercentage: true,
        ),
        ringStrokeWidth: 40.0,
      ),
    );
  }
}

class Invesments {
  List<InvesmentModel> list = [];
  Map<String, double> dataMap = {};

  Invesments();

  Invesments.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final invest = InvesmentModel.fromJson(item);
      list.add(invest);
      dataMap.addAll(invest.toDataMap());
    }
  }

  Invesments.mapFromJson(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final invest = InvesmentModel.fromJson(item);
      dataMap.addAll(invest.toDataMap());
    }
  }
}

class InvesmentModel {
  InvesmentModel({
    this.index,
    this.id,
    this.value,
    this.name,
    this.interestRate,
    this.date,
    this.expirationTime,
  });

  int index;
  String id;
  double value;
  String name;
  double interestRate;
  String date;
  int expirationTime;

  factory InvesmentModel.fromJson(Map<String, dynamic> json) => InvesmentModel(
        index: json["index"],
        id: json["id"],
        value: json["value"].toDouble(),
        name: json["name"],
        interestRate: json["interest_rate"].toDouble(),
        date: json["date"],
        expirationTime: json["expiration_time"],
      );

  Map<String, double> toDataMap() => {name: value.toDouble()};

  Map<String, dynamic> toJson() => {
        "index": index,
        "id": id,
        "value": value,
        "name": name,
        "interest_rate": interestRate,
        "date": date,
        "expiration_time": expirationTime,
      };
}

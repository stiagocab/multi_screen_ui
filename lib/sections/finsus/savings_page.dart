import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_ui/sections/finsus/finsus_data.dart';
import 'package:multi_ui/sections/finsus/widgets.dart';

class SavingsPage extends StatefulWidget {
  @override
  _SavingsPageState createState() => _SavingsPageState();
}

class _SavingsPageState extends State<SavingsPage> {
  final movementsList = movements;
  double available = 0;
  double totalEntries = 0;
  double totalPayments = 0;
  bool showValues = true;

  double entriesBarSize = 0;
  double paymentsBarSize = 0;

  @override
  void initState() {
    super.initState();
    calculateAvailableMoney();
  }

  calculateAvailableMoney() {
    double entries = 0;
    double payments = 0;

    movementsList.forEach((element) {
      if (element["type"] == "entry") {
        entries += element["value"];
      } else {
        payments += element["value"];
      }
    });

    setState(() {
      totalEntries = entries;
      totalPayments = payments;
      available = entries - payments;
    });

    Timer(Duration(milliseconds: 500), () => calculateSize());
  }

  calculateSize() {
    final maxSize = 180.0;
    double entriesSize = 1.0;
    double paymentsSize = 1.0;

    if (totalEntries > totalPayments) {
      entriesSize = maxSize;
      final paymentsPercent = totalPayments / totalEntries;
      paymentsSize = maxSize * paymentsPercent;
    }

    if (totalPayments > totalEntries) {
      paymentsSize = maxSize;
      final entriesPercent = totalEntries / totalPayments;
      entriesSize = maxSize * entriesPercent;
    }

    if (totalPayments == 0 && totalEntries == 0) {
      entriesSize = 0;
      paymentsSize = 0;
    }

    setState(() {
      entriesBarSize = entriesSize;
      paymentsBarSize = paymentsSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          // color: Colors.indigo,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                hideShowValue(available, showValues),
                style: TextStyle(fontSize: 21.0, color: Colors.blueGrey[900]),
                textAlign: TextAlign.center,
              ),
              IconButton(
                icon: Icon(
                  Icons.remove_red_eye_rounded,
                  size: 18,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    showValues = !showValues;
                  });
                },
              )
            ],
          ),
        ),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  hideShowValue(totalPayments, showValues),
                  style: minTextStyle,
                ),
                Text(
                  "Gastos del mes",
                  style: minTextStyle,
                ),
                animatedBar(paymentsBarSize)
              ],
            ),
            Column(
              children: [
                Text(
                  hideShowValue(totalEntries, showValues),
                  style: minTextStyle,
                ),
                Text(
                  "Abonos del mes",
                  style: minTextStyle,
                ),
                animatedBar(
                  entriesBarSize,
                )
              ],
            )
          ],
        )
      ],
    ));
  }
}

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
    double entries = 10;
    double payments = 10;

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

    Timer(Duration(milliseconds: 200), () => calculateSize());
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

    if (totalEntries == 0) entriesSize = 5;
    if (totalPayments == 0) paymentsSize = 5;

    setState(() {
      entriesBarSize = entriesSize;
      paymentsBarSize = paymentsSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.1,
          bottom: MediaQuery.of(context).size.width * 0.6),
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          // color: Colors.white,ç
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.0),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              renderCurrentValue(),
              SizedBox(height: 15.0),
              renderCharts(),
              SizedBox(height: 35.0),
              renderOptions()
            ],
          ),
        ),
      ),
    );
  }

  Widget renderOptions() {
    final TextStyle titleStyle = TextStyle(
      color: Colors.black38,
      fontSize: 12,
    );

    final TextStyle textStyle = TextStyle(
      color: Colors.black54,
      fontSize: 12,
    );

    final Icon iconCopy = Icon(Icons.copy, size: 16, color: Colors.grey);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CLABE BUTTON
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "CLABE",
                          style: titleStyle,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        iconCopy
                      ],
                    ),
                    Text("${DateTime.now().millisecondsSinceEpoch}",
                        style: textStyle)
                  ],
                ),
              ),
              // CLABE BUTTON END
              // CUENTA BUTTOn
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "CUENTA",
                          style: titleStyle,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        iconCopy
                      ],
                    ),
                    Text(
                      "${DateTime.now().millisecondsSinceEpoch ~/ 20}",
                      style: textStyle,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 15.0),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(opacityFinsusColor),
              overlayColor: MaterialStateProperty.all(opacityFinsusColor),
            ),
            onPressed: () {
              print("Ver movimientos");
            },
            child: Text(
              "Movimientos",
              style: TextStyle(color: finsusColor),
            ),
          )
        ],
      ),
    );
  }

  Widget renderCurrentValue() {
    return Container(
      // color: Colors.indigo,
      child: Column(
        children: [
          Text(
            "Saldo actual",
            style: microTextStyle,
          ),
          Row(
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
        ],
      ),
    );
  }

  Widget renderCharts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Text(
              hideShowValue(totalPayments, showValues),
              style: minTextStyle,
            ),
            animatedBar(paymentsBarSize),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Gastos del mes",
              style: microTextStyle,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              hideShowValue(totalEntries, showValues),
              style: minTextStyle,
            ),
            animatedBar(
              entriesBarSize,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Abonos del mes",
              style: microTextStyle,
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multi_ui/sections/finsus/investments_page.dart';
import 'package:multi_ui/sections/finsus/savings_page.dart';

final finsusColor = Color(0xFF0195CE);
final lightFinsusColor = Color(0x000195CE);

Widget backgroundHomePage({Widget child, BuildContext context}) {
  return SafeArea(
      child: Stack(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        // margin: EdgeInsets.only(top: -100),
        decoration: BoxDecoration(
            color: Color(0xFF0195CE),
            borderRadius: BorderRadius.only(
              bottomLeft:
                  Radius.circular(MediaQuery.of(context).size.width * 0.3),
              bottomRight:
                  Radius.circular(MediaQuery.of(context).size.width * 0.3),
            )),
      ),
      Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.03,
          left: MediaQuery.of(context).size.width * 0.1,
        ),
        child: child,
      ),
    ],
  ));
}

Widget tapButtonGenerator(List tabs) {
  List<Widget> buttonElements = [];

  tabs.forEach((item) {
    buttonElements.add(Tab(
      text: item["title"],
    ));
  });

  return TabBar(
    indicatorWeight: 3.0,
    tabs: buttonElements,
    indicatorColor: finsusColor,
    labelColor: finsusColor,
  );
}

Widget tabPageGenerator() {
  return TabBarView(
    children: [SavingsPage(), InvesmentsPage()],
  );
}

String hideShowValue(dynamic val, bool show, {String type = "money"}) {
  if (!show) {
    return "--";
  }

  if (type == "money") {
    return "\$ ${val.toStringAsFixed(2)}";
  }

  return "$val";
}

final minTextStyle = TextStyle(fontSize: 12, color: Colors.grey);

Widget animatedBar(double size) {
  return Container(
    height: 200,
    // alignment: Align,
    // color: Colors.red,
    // padding: EdgeInsets.only(top: calculatePadd()),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedContainer(
          margin: EdgeInsets.only(top: 20),
          duration: Duration(seconds: 1, milliseconds: 200),
          color: finsusColor,
          width: 50.0,
          height: size,
          // child: Text("$size"),
        )
      ],
    ),
  );
}

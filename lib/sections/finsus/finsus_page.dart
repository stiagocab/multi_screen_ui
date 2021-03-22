import 'package:flutter/material.dart';
import 'package:multi_ui/sections/finsus/investments_page.dart';
import 'package:multi_ui/sections/finsus/savings_page.dart';
import 'package:multi_ui/sections/finsus/widgets.dart';

class FinsusPage extends StatefulWidget {
  @override
  _FinsusPageState createState() => _FinsusPageState();
}

class _FinsusPageState extends State<FinsusPage> {
  String selectedRoute = "Ahorro";
  final sites = [
    {
      "title": "Ahorro",
    },
    {
      "title": "Inversiones",
    }
  ];

  onTabPress(t) {
    setState(() {
      selectedRoute = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Color(0xFF0195CE),
          centerTitle: true,
          title: Text("MIS CUENTAS"),
        ),
        body: SafeArea(
          child: backgroundHomePage(
            child: Card(
              elevation: 2,
              shadowColor: Colors.black,
              child: Container(
                // height: 300,
                width: MediaQuery.of(context).size.width * 0.8,
                // padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // TABS BUTTONS
                    tapButtonGenerator(
                      sites,
                    ),
                    // TABS SITES
                    Container(
                      height: 350,
                      padding: EdgeInsets.all(10),
                      child: TabBarView(
                        children: [SavingsPage(), InvesmentsPage()],
                      ),
                    )
                  ],
                ),
              ),
            ),
            context: context,
          ),
        ),
      ),
    );
  }
}

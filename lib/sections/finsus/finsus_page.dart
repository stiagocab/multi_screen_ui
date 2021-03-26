import 'package:flutter/material.dart';
import 'package:multi_ui/sections/finsus/investments_page.dart';
import 'package:multi_ui/sections/finsus/savings_page.dart';
import 'package:multi_ui/sections/finsus/widgets.dart';

class FinsusPage extends StatefulWidget {
  @override
  _FinsusPageState createState() => _FinsusPageState();
}

class _FinsusPageState extends State<FinsusPage>
    with SingleTickerProviderStateMixin {
  String selectedRoute = "Ahorro";
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          backgroundColor: secondaryColor,
          centerTitle: true,
          title: Text("MIS CUENTAS"),
          bottom: tapButtonGenerator(sites, _tabController),
        ),
        body: Container(
          child: TabBarView(
            controller: _tabController,
            children: [SavingsPage(), InvesmentsPage()],
          ),
        ),
      ),
    );
  }
}

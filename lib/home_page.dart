import 'package:flutter/material.dart';
// list of data with titles and route
import 'package:multi_ui/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("improveUX"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.brightness_4,
              ),
              onPressed: null)
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemCount: routesItems.length,
          itemBuilder: (BuildContext context, int i) {
            return Card(
              child: ListTile(
                enabled: routesItems[i]["route"] != null,
                // shape: ShapeBorder(

                // ),
                onTap: () {
                  if (routesItems[i]["route"] == null) return false;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          routesItems[i]["route"],
                    ),
                  );
                },
                // tileColor: Colors.red,
                title: Text(
                  routesItems[i]["name"],
                  style: TextStyle(color: routesItems[i]["color"]),
                ),
                subtitle: Text(
                  routesItems[i]["subtitle"],
                ),
                leading: Container(
                  child: Icon(
                    routesItems[i]["icon"],
                    color: routesItems[i]["color"],
                    size: 30,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

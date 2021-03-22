import 'package:flutter/material.dart';

class FinsusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Color(0xFF0195CE),
        centerTitle: true,
        title: Text("MIS CUENTAS"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              // margin: EdgeInsets.only(top: -100),
              decoration: BoxDecoration(
                  color: Color(0xFF0195CE),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        MediaQuery.of(context).size.width * 0.3),
                    bottomRight: Radius.circular(
                        MediaQuery.of(context).size.width * 0.3),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
                left: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Card(
                elevation: 2,
                shadowColor: Colors.black,
                child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("asdsa"),
                        Text("asdsa"),
                        Text("asdsa"),
                        Text("asdsa"),
                        Text("asdsa"),
                        Text("asdsa"),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

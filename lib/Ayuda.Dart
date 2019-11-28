import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';

class Ayuda extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AyudaState();
  }
}

class AyudaState extends State<Ayuda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Ayuda"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Container(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                width: 200,
                height: 200,
              ),
              SizedBox(height: 5.0),
              Padding(
                  padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 8.0),
                  child: Text(
                      "Aqui va la ayudaaaaaa",
                      style: TextStyle(
                          color: col_blue_gray,
                          fontSize: 20,
                          fontFamily: 'GoogleSans'),
                      textAlign: TextAlign.center)),
            ],
          ),
        ),
      ),
    );
  }
}

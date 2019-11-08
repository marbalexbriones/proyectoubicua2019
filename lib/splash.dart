import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: col_light_gray,
      body: Container(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(
                "assets/images/logo_text.png",
                width: 250,
                height: 265,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

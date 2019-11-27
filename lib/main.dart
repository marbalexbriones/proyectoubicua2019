import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'package:proyectoubicua2019/login.dart';

import 'inicio.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData(primarySwatch: Colors.cyan,),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: whatLogin(),
      title: new Text(
        'Bienvenido!',
        style: new TextStyle(fontSize: 25.0, fontFamily: "GoogleSans",color: colBlueGray),
      ),
      
      image: Image.asset("assets/images/logo_text.png"),
      backgroundColor: colLightGray,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: colPrimary,
    );
  }

  whatLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getInt('counter') ?? -1;
    if (counter >= 0) {
      return new Inicio();
    }
    else {
      return new Login();
    }
  }
}
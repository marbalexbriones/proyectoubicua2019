import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'package:proyectoubicua2019/inicio.dart';
import 'package:proyectoubicua2019/login.dart';
import 'package:proyectoubicua2019/model/usuario_model.dart';
import 'package:proyectoubicua2019/db/database.dart';

Future<User> getUser() async {
  final prefs = await SharedPreferences.getInstance();
  // Try reading data from the counter key. If it doesn't exist, return 0.
  int id = prefs.getInt('idParent') ?? 0;
  return await PastilleroDataBaseProvider.db.getUserWithId(id);
}

void main() {
  runApp(new MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.cyan,
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<User> user;

  @override
  void initState() {
    super.initState();
    user = getUser();
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: user,
        builder: (BuildContext context, AsyncSnapshot<User> userUR) {
          if (userUR.hasData) {
            return SplashScreen(
              seconds: 2,
              navigateAfterSeconds: new Inicio(),
              title: new Text(
                'Bienvenido!',
                style: new TextStyle(
                    fontSize: 25.0,
                    fontFamily: "GoogleSans",
                    color: col_blue_gray),
              ),
              image: Image.asset("assets/images/logo_text.png"),
              backgroundColor: col_light_gray,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 100.0,
              onClick: () => print("Flutter Egypt"),
              loaderColor: col_primary,
            );
          } else {
            return SplashScreen(
              seconds: 2,
              navigateAfterSeconds: new Login(),
              title: new Text(
                'Bienvenido!',
                style: new TextStyle(
                    fontSize: 25.0,
                    fontFamily: "GoogleSans",
                    color: col_blue_gray),
              ),
              image: Image.asset("assets/images/logo_text.png"),
              backgroundColor: col_light_gray,
              styleTextUnderTheLoader: new TextStyle(),
              photoSize: 100.0,
              onClick: () => print("Flutter Egypt"),
              loaderColor: col_primary,
            );
          }
        });
  }
}

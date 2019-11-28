import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'package:proyectoubicua2019/aviso.dart';
import 'package:proyectoubicua2019/inicio.dart';
import 'package:proyectoubicua2019/login.dart';
import 'package:proyectoubicua2019/aniadir.dart';
import 'package:proyectoubicua2019/editar.dart';
import 'package:proyectoubicua2019/AcercaDe.dart';
import 'package:proyectoubicua2019/Ayuda.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome In SplashScreen Package"),
        automaticallyImplyLeading: false,
      ),
      body: new Center(
          child: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text("Registro"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Registro()));
            },
          ),
          RaisedButton(
            child: Text("Perfil"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Perfil()));
            },
          ),
          RaisedButton(
            child: Text("Login"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
          RaisedButton(
            child: Text("Aviso"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Aviso()));
            },
          ),
          RaisedButton(
            child: Text("Recuperar"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Recuperar()));
            },
          ),
          RaisedButton(
            child: Text("Aniadir"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Aniadir(false)));
            },
          ),
          RaisedButton(
            child: Text("Editar"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Editar()));
            },
          ),
          RaisedButton(
            child: Text("Acerca"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Acerca()));
            },
          ),
          RaisedButton(
            child: Text("Ayuda"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Ayuda()));
            },
          ),
        ],
      )),
    );
  }
}

/*import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text('Welcome In SplashScreen',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      image: new Image.network('https://flutter.io/images/catalog-widget-placeholder.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red,
    );
  }

  // whatLogin() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final counter = prefs.getInt('counter') ?? -1;
  //   if (counter >= 0) {
  //     return new Inicio();
  //   }
  //   else {
  //     return new Login();
  //   }
  // }
}
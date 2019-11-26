import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:proyectoubicua2019/Recuperar.dart';
import 'package:proyectoubicua2019/registro.dart';
import 'package:proyectoubicua2019/perfil.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'package:proyectoubicua2019/aviso.dart';
import 'package:proyectoubicua2019/login.dart';
import 'package:proyectoubicua2019/aniadir.dart';
import 'package:proyectoubicua2019/editar.dart';
import 'package:proyectoubicua2019/AcercaDe.dart';
import 'package:proyectoubicua2019/Ayuda.dart';

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
      navigateAfterSeconds: new Login(),
      title: new Text(
        'Bienvenido!',
        style: new TextStyle(fontSize: 25.0, fontFamily: "GoogleSans",color: col_blue_gray),
      ),
      
      image: Image.asset(
                "assets/images/logo_text.png"
              ),
      backgroundColor: col_light_gray,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Flutter Egypt"),
      loaderColor: col_primary,
    );
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Aniadir(false)));
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
    /*return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.cyan,),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );*/
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text("Registro"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Registro()));},
            ),
            RaisedButton(
              child: Text("Perfil"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Perfil()));},
            ),
            RaisedButton(
              child: Text("Splash Screen"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Splash()));},
            ),
            RaisedButton(
              child: Text("Login"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));},
            ),
            RaisedButton(
              child: Text("Aviso"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Aviso()));},
            ),
            RaisedButton(
              child: Text("Recuperar"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Recuperar()));},
            ),
            RaisedButton(
              child: Text("Aniadir"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Aniadir()));},
            ),
            RaisedButton(
              child: Text("Editar"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Editar()));},
            ),
            RaisedButton(
              child: Text("Acerca"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Acerca()));},
            ),
             RaisedButton(
              child: Text("Ayuda"),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Ayuda()));},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
*/

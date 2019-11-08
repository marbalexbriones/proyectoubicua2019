import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'package:proyectoubicua2019/splash.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  var username = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                width: 200,
                height: 200,
              ),
              SizedBox(height: 5.0),
              Center(
                  child: Text(
                "Iniciar Sesión",
                style: TextStyle(color: col_blue_gray, fontSize: 30),
              )),
              SizedBox(height: 5.0),
              Padding(
                padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre de Usuario:',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'El campo no debe estar vacío';
                    } else {
                      username = value;
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña:',
                    focusColor: col_primary,
                    hoverColor: col_primary,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'El campo no debe estar vacío';
                    } else {
                      password = value;
                    }
                    return null;
                  },
                ),
              ),
              OutlineButton(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 0.0,
                ),
                shape: StadiumBorder(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Splash()),
                  );
                },
                child: Text(
                  'Olvidé mi contraseña',
                  style: TextStyle(fontSize: 12, color: Colors.cyan),
                ),
              ),
              RaisedButton(
                color: col_primary,
                shape: StadiumBorder(),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Splash()),
                  );
                },
                child: Text('Iniciar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
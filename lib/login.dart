import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/Recuperar.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'package:proyectoubicua2019/registro.dart';
import 'package:proyectoubicua2019/splash.dart';

import 'colors.dart';
import 'splash.dart';

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
      body: Center(
        child: Container(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 5.0),
              Center(
                  child: Text(
                "Iniciar Sesión",
                style: TextStyle(
                    color: col_blue_gray,
                    fontSize: 25,
                    fontFamily: 'GoogleSans'),
              )),
              Padding(
                padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre de Usuario:',
                    labelStyle: TextStyle(fontFamily: "GoogleSans"),
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
                    labelStyle: TextStyle(fontFamily: "GoogleSans"),
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
              new SizedBox(height: 5.0),
              Padding(
                padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                child: MaterialButton(
                  minWidth: 100.0,
                  height: 40.0,
                  elevation: 5,
                  onPressed: () {},
                  color: col_primary,
                  child: Text(
                    'Enviar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                child: OutlineButton(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 0.0,
                  ),
                  shape: StadiumBorder(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Recuperar()),
                    );
                  },
                  child: Text(
                    'Olvidé mi contraseña',
                    style: TextStyle(fontSize: 15, color: col_primary),
                  ),
                ),
              ),
              new SizedBox(height: 90.0),
              Padding(
                padding: EdgeInsets.fromLTRB(75.0, 0.0, 75.0, 0.0),
                child: Row(
                  children: <Widget>[
                    Text("¿Aún no tienes cuenta?"),
                    OutlineButton(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.0,
                      ),
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Registro()),
                        );
                      },
                      child: Text(
                        'Registrate',
                        style: TextStyle(fontSize: 15, color: col_primary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

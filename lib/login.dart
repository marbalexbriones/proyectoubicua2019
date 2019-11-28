import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'package:proyectoubicua2019/db/database.dart';
import 'package:proyectoubicua2019/registro.dart';
import 'package:proyectoubicua2019/inicio.dart';

import 'colors.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          autovalidate: _autovalidate,
          key: _formKey,
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
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de Usuario (correo):',
                    labelStyle: TextStyle(fontFamily: "GoogleSans"),
                  ),
                  validator: validateEmail,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 50.0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Contraseña:',
                    labelStyle: TextStyle(fontFamily: "GoogleSans"),
                  ),
                  validator: validatePassword,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                child: MaterialButton(
                  minWidth: 100.0,
                  height: 40.0,
                  elevation: 5,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {

                      var user = await PastilleroDataBaseProvider.db.getUserWithEmail(emailController.text);
                      if (user != null) {
                        if (user.password.toString() == passwordController.text.toString()) {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          setState(() {
                            prefs.setInt('idParent', user.idUser);
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Inicio()),
                          );
                        }
                        else {
                          Fluttertoast.showToast(msg: 'Incorrecto !', toastLength: Toast.LENGTH_SHORT);
                        }
                      } 
                      else {
                        Fluttertoast.showToast(msg: 'Incorrecto !', toastLength: Toast.LENGTH_SHORT);
                      }
                    }
                    return null;
                  },
                  color: col_primary,
                  child: Text(
                    'Acceder',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
                child: MaterialButton(
                  minWidth: 100.0,
                  height: 40.0,
                  elevation: 5,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Inicio()),
                    );
                  },
                  color: col_primary,
                  child: Text(
                    'Accede Sin loginr',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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

  String validatePassword(String value) {
    if (value.length < 8) {
      return 'Verifica tus datos';
    } else {
      return null;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Verifica tus datos';
    } else {
      return null;
    }
  }

}

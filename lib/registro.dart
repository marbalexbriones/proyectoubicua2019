import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';

class Registro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistroState();
  }
}

class RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Registro")),
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 0.0),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Center(
                      child: Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                        color: col_blue_gray,
                        fontSize: 25,
                        fontFamily: 'GoogleSans'),
                  )),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontFamily: "GoogleSans"),
                        labelText: "Nombre",
                        hintText: "Ej. Juan",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontFamily: "GoogleSans"),
                        labelText: "Apellido",
                        hintText: "Ej. Peres",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontFamily: "GoogleSans"),
                        labelText: "Correo",
                        hintText: "correo@ejemplo.com",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontFamily: "GoogleSans"),
                        labelText: "Contraseña",
                      ),
                      obscureText: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontFamily: "GoogleSans"),
                        labelText: "Repetir contraseña",
                      ),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 190),
                    child: MaterialButton(
                      minWidth: 100.0,
                      height: 40.0,
                      elevation: 5,
                      onPressed: () {},
                      color: col_primary,
                      child: Text(
                        'Registrarse',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

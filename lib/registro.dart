import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';

import 'db/database.dart';
import 'model/usuario_model.dart';

class Registro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistroState();
  }
}

class RegistroState extends State<Registro> {
  final _formKay = GlobalKey<FormState>();
  TextEditingController nameEditingController = TextEditingController(); // para capturar datos
  TextEditingController lnameEditingController = TextEditingController(); 
  TextEditingController emailEditingController = TextEditingController(); 
  TextEditingController passEditingController = TextEditingController(); 
  TextEditingController pass2EditingController = TextEditingController(); 
  TextEditingController mobileEditingController = TextEditingController(); 
  TextEditingController ageEditingController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Registro")),
        body: Form(
          key: _formKay,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 0.0),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Center(
                    child: Text("Iniciar Sesión",
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
                      controller: nameEditingController,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: TextFormField(
                      controller: lnameEditingController,
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
                      controller: emailEditingController,
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
                      controller: mobileEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontFamily: "GoogleSans"),
                        labelText: "Telefono",
                        hintText: "12345678",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: TextFormField(
                      controller: ageEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontFamily: "GoogleSans"),
                        labelText: "Edad",
                        hintText: "12345678",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: TextFormField(
                      controller: passEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontFamily: "GoogleSans"),
                        labelText: "Contraseña",
                      ),
                      obscureText: true,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: TextFormField(
                      controller: pass2EditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontFamily: "GoogleSans"),
                        labelText: "Repetir contraseña",
                      ),
                      obscureText: true,
                    ),
                  ),
                  MaterialButton(
                    elevation: 5,
                    onPressed: () async {
                      if(!_formKay.currentState.validate()){
                        Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Procesing data"))
                        );
                      }else {
                        // Si no existe
                        User s = new User(
                          name: nameEditingController.text,
                          lname: lnameEditingController.text,
                          email: emailEditingController.text,
                          password: passEditingController.text,
                          mobile: mobileEditingController.text,
                          sex: "male",
                          age: ageEditingController.text,
                        );
                        //si no existe, entonces
                        // If () ... { }
                        var user = await PastilleroDataBaseProvider.db.getUserWithEmail(s.email);
                        if (user == null) {
                           await PastilleroDataBaseProvider.db.addUserToDatabase(s);
                          Navigator.pop(context);
                        }
                      }
                    },
                    color: col_primary,
                    child: Text(
                      'Registrarse',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}


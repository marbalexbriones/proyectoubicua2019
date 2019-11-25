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
  TextEditingController nameEditingController = TextEditingController(); // para capturar datos
  TextEditingController lnameEditingController = TextEditingController(); 
  TextEditingController emailEditingController = TextEditingController(); 
  TextEditingController passEditingController = TextEditingController(); 
  TextEditingController pass2EditingController = TextEditingController(); 
  TextEditingController mobileEditingController = TextEditingController(); 
  TextEditingController ageEditingController = TextEditingController(); 

  final _formKay = GlobalKey<FormState>();
  int _radioValue1 = -1;
  String _gender = "none";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Registro")),
        body: Form(
          key: _formKay,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      validator: validateName,
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
                      validator: validateLName,
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
                      validator: validateEmail,
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
                      validator: validateNumber,
                      controller: mobileEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontFamily: "GoogleSans"),
                        labelText: "Telefono",
                        hintText: "1234567890",
                      ),
                    ),
                  ),
                  Text(
                    "Genero",
                    style: TextStyle(
                    color: col_blue_gray,
                    fontSize: 20,
                    fontFamily: 'GoogleSans'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      new Text(
                        'Masculino',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 1,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      new Text(
                        'Femenino',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: TextFormField(
                      validator: validateAge,
                      controller: ageEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(fontFamily: "GoogleSans"),
                        labelText: "Edad",
                        hintText: "0 - 100",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: TextFormField(
                      validator: validatePassword,
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
                      validator: validatePassword,
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
                    onPressed: _createUser,
                    color: col_primary,
                    child: Text(
                      'Registrarse',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ),
          ),
        ));
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          break;
        case 1:
          _gender = "masculino";
          break;
        case 2:
          _gender = "femenino";
          break;
      }
    });
  }

  void _createUser () async {
    if(!_formKay.currentState.validate()){
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text("Procesing data"))
      );
    }
    else {
      // Si no existe
      User s = new User(
        name: nameEditingController.text,
        lname: lnameEditingController.text,
        email: emailEditingController.text,
        password: passEditingController.text,
        mobile: mobileEditingController.text,
        gender: _gender,
        age: ageEditingController.text,
        parent_id: -1,
      );
      //si no existe, entonces
      // If () ... { }
      var user = await PastilleroDataBaseProvider.db.getUserWithEmail(s.email);
      if (user == null) {
        await PastilleroDataBaseProvider.db.addUserToDatabase(s);
        Navigator.pop(context);
      }
    }
  }

  String validatePassword(String value) {
    if (value.length < 8) {
      return 'La contraseña debe tener 8 caracteres mínimo';
    }
    else {
      return null;
    }
  }

  String validateNumber(String value) {
    if (value.length != 10) {
      return 'El número debe tener 10 digitos';
    }
    else {
      return null;
    }
  }
  String validateName(String value) {
    if (value.length == 0) {
      return 'Ingresa un nombre';
    }
    else {
      return null;
    }
  }

  String validateLName(String value) {
    if (value.length == 0) {
      return 'Ingresa un apellido';
    }
    else {
      return null;
    }
  }
  String validateAge(String value) {
    if (!(int.parse(value) >= 0 || int.parse(value) <= 100)) {
      return 'La edad debe estar entre 0 y 100 años';
    }
    else {
      return null;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Verifica tus datos';
    }
    else {
      return null;
    }
  }
}


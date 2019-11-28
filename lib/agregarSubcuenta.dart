import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/database.dart';
import 'model/usuario_model.dart';

class AniadirSubCuenta extends StatefulWidget {
  AniadirSubCuenta();

  @override
  State<StatefulWidget> createState() {
    return AniadirSubCuentaState();
  }
}

getUserId() async {
  final prefs = await SharedPreferences.getInstance();
  // Try reading data from the counter key. If it doesn't exist, return 0.
  return prefs.getInt('idParent') ?? 0;
}

class AniadirSubCuentaState extends State<AniadirSubCuenta> {
  /*TextEditingController idUserEditingController = TextEditingController(); // para capturar datos*/
  TextEditingController nameEC = TextEditingController();
  TextEditingController lnameEC = TextEditingController();
  TextEditingController mobileEC = TextEditingController();
  TextEditingController ageEG = TextEditingController();

  int _radioValue1 = -1;
  String _gender = "none";

  final _formKay = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agregar Cuenta Secundaria"),
          backgroundColor: col_primary,
        ),
        body: Form(
          key: _formKay,
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: TextFormField(
                        validator: validateName,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontFamily: "GoogleSans"),
                          labelText: "Nombre",
                          hintText: "Ej. Juan",
                        ),
                        controller: nameEC,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: TextFormField(
                        validator: validateLName,
                        controller: lnameEC,
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
                        validator: validateNumber,
                        controller: mobileEC,
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
                        controller: ageEG,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontFamily: "GoogleSans"),
                          labelText: "Edad",
                          hintText: "0 - 100",
                        ),
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
                )),
          ),
        ));
  }

  void _createUser() async {
    if (!_formKay.currentState.validate()) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Procesing data")));
    } else {
      List<User> lista = await PastilleroDataBaseProvider.db.getAllUsers();
      print("El usuario padre es " + (await getUserId()).toString());
      await PastilleroDataBaseProvider.db.addUserToDatabase(new User(
        idUser: lista.length + 1,
        name: nameEC.text,
        lname: lnameEC.text,
        email: "",
        password: "",
        mobile: mobileEC.text,
        gender: _gender,
        age: ageEG.text,
        parent_id: await getUserId(),
      ));
      Navigator.pop(context);
    }
  }

//VALIDATORS

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

  String validateNumber(String value) {
    if (value.length != 10) {
      return 'El número debe tener 10 digitos';
    } else {
      return null;
    }
  }

  String validateName(String value) {
    if (value.length == 0) {
      return 'Ingresa un nombre';
    } else {
      return null;
    }
  }

  String validateLName(String value) {
    if (value.length == 0) {
      return 'Ingresa un apellido';
    } else {
      return null;
    }
  }

  String validateAge(String value) {
    if (!(int.parse(value) >= 0 || int.parse(value) <= 100)) {
      return 'La edad debe estar entre 0 y 100 años';
    } else {
      return null;
    }
  }
}

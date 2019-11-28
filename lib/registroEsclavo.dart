import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/database.dart';
import 'model/usuario_model.dart';

class RegistroEsclavo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegistroEsclavoState();
  }
}

class RegistroEsclavoState extends State<RegistroEsclavo> {
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
      appBar: AppBar(title: Text("Registro de esclavo")),
      body: Form(
        key: _formKay,
        child: SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(

                            colorFilter: new ColorFilter.mode(Colors.blue
                                .withOpacity(1.0), BlendMode.darken),
                            image: AssetImage('assets/images/messi.jpg',),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Row(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20, bottom: 25),),
                            Container(
                              padding: EdgeInsets.only(right: 100),
                              width: 70,
                              height: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/messi2.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5,
                                  )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, bottom: 25),),
                            Text("Nombre Usuario", style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),),
                          ],),
                        ),

                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 200),),
                    Container(
                      width: 100,


                    ),

                    FloatingActionButton(
                      onPressed: _createEsclavo,
                      child: Icon(Icons.save),
                      backgroundColor: Colors.yellow,
                    ),

                  ],
                ),


                Container(
                  padding: EdgeInsets.only(left: 12),
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
                  padding: EdgeInsets.only(left: 12),
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
                  padding: EdgeInsets.only(left: 12),
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
                  padding: EdgeInsets.only(left: 12),
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
                Container(
                  padding: EdgeInsets.only(left: 12, top: 10),
                  child: Text(

                    "Genero",
                    style: TextStyle(
                        color: col_blue_gray,
                        fontSize: 20,
                        fontFamily: 'GoogleSans'),
                  ),),
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
                  padding: EdgeInsets.only(left: 12),
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
                  padding: EdgeInsets.only(left: 12),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Comentarios",
                        hintText: "Asma hereditaria,Alergia: al gluten"
                    ),
                  ),
                ),

              ],
            )
        ),
      ),
    );
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

  void _createEsclavo () async {

    if ( _formKay.currentState.validate()) {
      var user = await PastilleroDataBaseProvider.db.getUserWithEmail(
          emailEditingController.text);
      if (user != null) {
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text("Procesing data"))
        );
      }
      else {
        // Si no existe
        if (!_formKay.currentState.validate()) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("Procesing data"))
          );
        }
        else {
          // Si no existe
          List<User> lista=  await PastilleroDataBaseProvider.db.getAllUsers();
          final prefs = await SharedPreferences.getInstance();
          User s = new User(
              idUser:lista.length+1,
              name: nameEditingController.text,
              lname: lnameEditingController.text,
              email: emailEditingController.text,
              password: "",
              mobile: mobileEditingController.text,
              gender: _gender,
              age: ageEditingController.text,
              parent_id: prefs.getInt('idParent')
          );
          //si no existe, entonces
          // If () ... { }
          var user = await PastilleroDataBaseProvider.db.getUserWithEmail(
              s.email);
          if (user == null) {
            await PastilleroDataBaseProvider.db.addUserToDatabase(s);
            Navigator.pop(context);
            print(Text("Lo agrego"));
            print(s.parent_id);
          }
        }
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




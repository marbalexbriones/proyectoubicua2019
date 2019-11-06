import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Registro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Registro")),
      body: Form(child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    hintText: "Ej. Juan",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Apellido",
                    hintText: "Ej. Peres",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Correo",
                    hintText: "correo@ejemplo.com",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Repetir contraseña",
                  ),
                  obscureText: true,
                ),
              ),
              Text("Ayuda"),
              Center(
                child: RaisedButton(
                  color: Colors.cyanAccent,
                  child: Text("Registrarse"),
                  onPressed: (){},
                ),
              )
            ],
          ),
        ),
      ),)
    );
  }

}
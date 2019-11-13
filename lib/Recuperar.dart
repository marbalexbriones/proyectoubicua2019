import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class Recuperar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperar"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Recuperar Contraseña",
                style: TextStyle(fontSize: 25, color: col_blue_gray, fontFamily: "GoogleSans")),
            Text(
              "Se enviara un correo para cambiar tu contraseña",
              style: TextStyle(color: col_blue_gray, fontFamily: "GoogleSans"),
            ),
            Container(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: col_primary, fontFamily: "GoogleSans"),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: col_primary))),
                style: TextStyle(color: Colors.black),
              ),
            ),
            new SizedBox(height: 5.0),
            Container(
              padding: EdgeInsets.only(left: 190),
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
            )
          ],
        ),
      ),
    );
  }
}

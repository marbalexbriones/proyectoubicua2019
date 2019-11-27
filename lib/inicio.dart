import 'package:proyectoubicua2019/aniadir.dart';

import 'drawer.dart';
import 'pastillas.dart';
import 'directorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'perfil.dart';

class Inicio extends StatelessWidget {

  final doctors = [
    {
      "imagen": "assets/images/doctor.png",
      "nombre": "Juan Carlos",
      "lugar": "San Luis Potosí",
      "telefono": "44421231234"
    },
    {
      "imagen": "assets/images/doctor.png",
      "nombre": "Juan Carlos",
      "lugar": "San Luis Potosí",
      "telefono": "44421231234"
    },
    {
      "imagen": "assets/images/doctor.png",
      "nombre": "Juan Carlos",
      "lugar": "San Luis Potosí",
      "telefono": "44421231234"
    },
    {
      "imagen": "assets/images/doctor.png",
      "nombre": "Juan Carlos",
      "lugar": "San Luis Potosí",
      "telefono": "44421231234"
    },
    {
      "imagen": "assets/images/doctor.png",
      "nombre": "Juan Carlos",
      "lugar": "San Luis Potosí",
      "telefono": "44421231234"
    },
    {
      "imagen": "assets/images/doctor.png",
      "nombre": "Juan Carlos",
      "lugar": "San Luis Potosí",
      "telefono": "44421231234"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: colLightGray,
              tabs: [
                Column(
                  children: <Widget>[
                    Icon(Icons.person),
                    Text('Perfil'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.alarm),
                    Text('Alarmas'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.contact_phone),
                    Text('Directorio'),
                  ],
                ),
              ],
            ),
            title: Text('Inicio'),
            backgroundColor: colPrimary,
          ),
          body: TabBarView(
            children: [
              new Scaffold(
                body: Perfil(),
              ),
              //Perfil(),
              new Scaffold(
                body: Pastillas(),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                context, MaterialPageRoute(builder: (context) => Aniadir()));
                  },
                  splashColor: colPrimary,
                  backgroundColor: colPrimary,
                  elevation: 3,

                ),
              ),

              Directorio(dataSource: doctors),
            ],
          ),
        ),
      ),
    );
  }
}

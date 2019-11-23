import 'drawer.dart';
import 'pastillas.dart';
import 'directorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'perfil.dart';

class Inicio extends StatelessWidget {

  final example = [
    {
      "imagen": "assets/images/pastilla.jpg",
      "nombre": "Paracetamol",
      "dosis": "500 mg",
      "tiempo": "8 OO",
      "restantes": "25 restantes"
    },
    {
      "imagen": "assets/images/pastilla.jpg",
      "nombre": "Paracetamol",
      "dosis": "500 mg",
      "tiempo": "8 horas",
      "restantes": "25 restantes"
    },
    {
      "imagen": "assets/images/pastilla.jpg",
      "nombre": "Paracetamol",
      "dosis": "500 mg",
      "tiempo": "8 horas",
      "restantes": "25 restantes"
    },
    {
      "imagen": "assets/images/pastilla.jpg",
      "nombre": "Paracetamol",
      "dosis": "500 mg",
      "tiempo": "8 horas",
      "restantes": "25 restantes"
    }
  ];

  final doctors = [
    {
      "imagen": "assets/images/pastilla.jpg",
      "nombre": "Juan Carlos",
      "lugar": "San Luis Potosí",
      "telefono": "44421231234"
    },
    {
      "imagen": "assets/images/pastilla.jpg",
      "nombre": "Juan Carlos",
      "lugar": "San Luis Potosí",
      "telefono": "44421231234"
    },
    {
      "imagen": "assets/images/pastilla.jpg",
      "nombre": "Juan Carlos",
      "lugar": "San Luis Potosí",
      "telefono": "44421231234"
    },
    {
      "imagen": "assets/images/pastilla.jpg",
      "nombre": "Juan Carlos",
      "lugar": "San Luis Potosí",
      "telefono": "44421231234"
    },
    {
      "imagen": "assets/images/pastilla.jpg",
      "nombre": "Juan Carlos",
      "lugar": "San Luis Potosí",
      "telefono": "44421231234"
    },
    {
      "imagen": "assets/images/pastilla.jpg",
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
              unselectedLabelColor: col_light_gray,
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
            backgroundColor: col_primary,
          ),
          body: TabBarView(
            children: [
              new Scaffold(
                body: Perfil(),
              ),
              //Perfil(),
              new Scaffold(
                body: Pastillas(dataSource: example),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  splashColor: col_primary,
                  backgroundColor: col_primary,
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

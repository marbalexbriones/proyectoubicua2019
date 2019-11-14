import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'package:proyectoubicua2019/colors.dart';

final example = [
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
  },
  {
    "imagen": "assets/images/pastilla.jpg",
    "nombre": "Paracetamol",
    "dosis": "500 mg",
    "tiempo": "8 horas",
    "restantes": "25 restantes"
  }
];

class Inicio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InicioState();
  }
}

class InicioState extends State<Inicio> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Inicio"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: TabBarView(
        controller: new TabController(length: 3, vsync: this),
        children: [
          GridView.count(
            crossAxisCount: 2,
            children: List.generate(example.length + 1, (index) {
              if (index < example.length) {
                return customCard(
                    example[index]['imagen'],
                    example[index]['nombre'],
                    example[index]['dosis'],
                    example[index]['tiempo'],
                    example[index]['restantes']);
              } else {
                return addCard();
              }
            }),
          ),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
        ],
      ),

      /*GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          children: <Widget>[
            new ListView.builder(

          itemCount: example.length,
          itemBuilder: (BuildContext context, int index) {
            return customCard(example[index]['imagen'], example[index]['nombre'],
                example[index]['dosis'], example[index]['tiempo'], example[index]['restantes']);
          }),
          ],
      ),*/

      bottomNavigationBar: PastillAppNavBar(),
    );
  }
}

Widget customCard(String imagen, String nombre, String dosis, String time,
        String restantes) =>
    Card(
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset(imagen),
            Text(nombre),
            Text(dosis + " | " + time + " | " + restantes),
          ],
        ),
      ),
    );

Widget addCard() => Card(
      child: Center(
        child: Column(
          children: <Widget>[Text("Agregar")],
        ),
      ),
    );

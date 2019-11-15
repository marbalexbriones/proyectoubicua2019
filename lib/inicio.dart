import 'package:flutter/gestures.dart';
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

class InicioState extends State<Inicio> with TickerProviderStateMixin {
  int _tabSelection = 1;
  var controller;

  var bottomNavBar;
  var initial, distance;

  void _onItemTapped(int index) {
    setState(() {
      _tabSelection = index;
      controller.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    controller = TabController(initialIndex: 1, length: 3, vsync: this);
    bottomNavBar = BottomNavigationBar(
      backgroundColor: col_light_gray,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Perfil'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.alarm),
          title: Text('Alarmas'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_phone),
          title: Text('Directorio'),
        ),
      ],
      currentIndex: _tabSelection,
      selectedItemColor: Colors.cyan,
      onTap: _onItemTapped,
    );

    var tabs = [
      Icon(Icons.directions_transit),
      GridView.count(
        crossAxisCount: 2,
        children: List.generate(example.length + 1, (index) {
          if (index < example.length) {
            return customCard(
                example[index]['imagen'],
                example[index]['nombre'],
                example[index]['dosis'],
                example[index]['tiempo'],
                example[index]['restantes'],
                context);
          } else {
            return addCard();
          }
        }),
      ),
      Icon(Icons.directions_bike),
    ];

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Inicio"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: GestureDetector(
        onPanStart: (DragStartDetails details) {
          initial = details.globalPosition.dx;
        },
        onPanUpdate: (DragUpdateDetails details) {
          distance = details.globalPosition.dx - initial;
        },
        onPanEnd: (DragEndDetails details) {
          initial = 0.0;
          print(distance);
          if (distance < 0 && _tabSelection < 2) {
            setState(() {
              _tabSelection++;
              controller.animateTo(_tabSelection);
            });
          } else if (distance >= 0 && _tabSelection > 0){
            setState(() {
              _tabSelection--;
              controller.animateTo(_tabSelection);
            });
          }
          print(_tabSelection);
        },
        child: Center(
          child: tabs[_tabSelection],
        ),
        /*TabBarView(
          dragStartBehavior: DragStartBehavior.down,
          controller: controller,
          children: [
            
          ],
        ),*/
      ),
      bottomNavigationBar: bottomNavBar,
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

      //bottomNavigationBar: PastillAppNavBar(),
    );
  }
}

Widget customCard(String imagen, String nombre, String dosis, String time,
        String restantes, BuildContext context) =>
    Card(
      child: Center(
        child: Column(
          children: <Widget>[
            Image.asset(imagen),
            Text(nombre),
            Text(dosis + " | " + time + " | " + restantes),
            ButtonBar(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                  child: MaterialButton(
                    minWidth: 100.0,
                    height: 40.0,
                    elevation: 5,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
                      );
                    },
                    color: col_primary,
                    child: Text(
                      'Tomar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                  child: OutlineButton(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 0.0,
                    ),
                    shape: StadiumBorder(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
                      );
                    },
                    child: Text(
                      'Editar',
                      style: TextStyle(fontSize: 15, color: col_primary),
                    ),
                  ),
                ),
              ],
            )
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

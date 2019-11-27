import 'package:flutter/cupertino.dart';
import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final users = [
  {
    "imagen": "assets/images/user.png",
    "nombre": "Juan Carlos",
  },
];

class Usuarios extends StatelessWidget {
  final dataSource = users;
  //Usuarios({Key key, @required this.dataSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Usuarios"),
        backgroundColor: Colors.cyan,
      ),
      body: GridView.count(
        childAspectRatio: (1 / 0.17),
        crossAxisCount: 1,
        children: List.generate(dataSource.length, (index) {
          return userCard(dataSource[index]['imagen'],
              dataSource[index]['nombre'], context);
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Add your onPressed code here!
        },
        splashColor: colPrimary,
        backgroundColor: colPrimary,
        elevation: 3,
      ),
    );
  }
}

//CELDAS DE INICIO

Widget userCard(String imagen, String nombre, BuildContext context) => Padding(
      padding: EdgeInsets.all(5.0),
      child: Card(
          child: Row(
        children: <Widget>[
          Expanded(
            flex: 2, // 20%
            child: Image.asset(
              imagen,
              height: 130,
            ),
          ),
          Expanded(
            flex: 5, // 60%
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(nombre),
              ],
            ),
          ),
          Expanded(
            flex: 3, // 20%
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: MaterialButton(
                minWidth: 30.0,
                height: 30.0,
                elevation: 3,
                onPressed: () {
                  //AQUI VAMOS A CAMBIAR DE USUARIO
                },
                color: colPrimary,
                child: Text(
                  'Seleccionar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      )),
    );

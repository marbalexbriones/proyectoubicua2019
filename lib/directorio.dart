import 'package:flutter/cupertino.dart';
import 'inicio.dart';
import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Directorio extends StatelessWidget {
  var dataSource;
  Directorio({Key key, @required this.dataSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      children: List.generate(dataSource.length, (index) {
        return doctorCard(
            dataSource[index]['imagen'],
            dataSource[index]['nombre'],
            dataSource[index]['lugar'],
            dataSource[index]['telefono'],
            context);
      }),
    );
  }
}

//CELDAS DE INICIO

Widget doctorCard(String imagen, String nombre, String lugar, String telefono,
        BuildContext context) =>
    Row(
      
      children: <Widget>[
        Image.asset(
          imagen,
          width: 100,
          height: 100,
        ),
        Text(nombre),
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
      ],
    );

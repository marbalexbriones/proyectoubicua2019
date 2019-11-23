import 'package:flutter/cupertino.dart';
import 'inicio.dart';
import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Pastillas extends StatelessWidget {
  var dataSource;
  Pastillas({Key key, @required this.dataSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: (1 / 0.77),
      crossAxisCount: 1,
      children: List.generate(dataSource.length, (index) {
        return customCard(
            dataSource[index]['imagen'],
            dataSource[index]['nombre'],
            dataSource[index]['dosis'],
            dataSource[index]['tiempo'],
            dataSource[index]['restantes'],
            context);
      }),
    );
  }
}

//CELDAS DE INICIO

Widget customCard(String imagen, String nombre, String dosis, String time,
        String restantes, BuildContext context) =>
    Padding(
      padding: EdgeInsets.all(5.0),
      child: Center(
        child: Card(
          child: Column(
            children: <Widget>[
              Image.asset(imagen, width: 250),
              Center(
                child: Column(
                  children: <Widget>[
                    Text(nombre),
                    Text(dosis + " | " + time + " | " + restantes),
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 30.0,
                    height: 30.0,
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
                  MaterialButton(
                    minWidth: 30.0,
                    height: 30.0,
                    elevation: 3,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
                      );
                    },
                    color: Colors.white,
                    child: Text(
                      'Rellenar',
                      style: TextStyle(color: col_primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

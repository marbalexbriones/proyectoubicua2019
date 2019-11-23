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
      crossAxisCount: 2,
      children: List.generate(dataSource.length + 1, (index) {
        if (index < dataSource.length) {
          return customCard(
              dataSource[index]['imagen'],
              dataSource[index]['nombre'],
              dataSource[index]['dosis'],
              dataSource[index]['tiempo'],
              dataSource[index]['restantes'],
              context);
        } else {
          return addCard();
        }
      }),
    );
  }
}


//CELDAS DE INICIO

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

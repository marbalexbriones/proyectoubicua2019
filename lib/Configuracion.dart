import 'package:flutter/cupertino.dart';
import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final users = [
  {
    "imagen": "assets/images/pastilla.jpg",
    "nombre": "Juan Carlos",
  },
];

class Configuracion extends StatelessWidget {
  var dataSource = users;
  //Usuarios({Key key, @required this.dataSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Configuración"),
        backgroundColor: Colors.cyan,
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.check_box, color: col_primary),
              title: Text('Formato 12 horas:'),
              subtitle: Text('Mostrar 11:59pm o 23:59.'),
            ),
            ListTile(
              leading: Icon(Icons.alarm_off),
              trailing: Icon(Icons.check_box, color: col_primary),
              title: Text('Horas de silencio:'),
              subtitle: Text('Silenciar alarmas entre 10:00pm y 6:00am.'),
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              trailing: Icon(Icons.check_box, color: col_primary),
              title: Text('Recordar usuario'),
              subtitle: Text('No cerrar sesión al cerrar la aplicación.'),
            ),
            Center(
              child: Text(
                "Los elementos de esta pantalla son únicamente explicativos.",
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ),
          ],
        ).toList(),
      ),
    );
  }
}

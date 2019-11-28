import 'package:flutter/cupertino.dart';
import 'package:proyectoubicua2019/agregarSubcuenta.dart';
import 'package:proyectoubicua2019/inicio.dart';
import 'package:proyectoubicua2019/model/usuario_model.dart';
import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:proyectoubicua2019/db/database.dart';

final users = [
  {
    "imagen": "assets/images/user.png",
    "nombre": "Juan Carlos",
  },
];

Future<List<User>> getUserList() async {
  final prefs = await SharedPreferences.getInstance();
  // Try reading data from the counter key. If it doesn't exist, return 0.
  int id = prefs.getInt('idParent') ?? 0;
  print("Yo soy " + id.toString());
  User me = await PastilleroDataBaseProvider.db.getUserWithId(id);
  int idParent = me.parent_id;
  print("El padre mio es " + idParent.toString());
  return await PastilleroDataBaseProvider.db.getUserWithParentId(idParent);
}

getUserId() async {
  final prefs = await SharedPreferences.getInstance();
  // Try reading data from the counter key. If it doesn't exist, return 0.
  return prefs.getInt('idParent') ?? 0;
}

class Usuarios extends StatelessWidget {
  //var dataSource = users;
  Future<List<User>> users = getUserList();
  //Usuarios({Key key, @required this.dataSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Usuarios"),
        backgroundColor: Colors.cyan,
      ),
      body: FutureBuilder(
          future: users,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                  childAspectRatio: (1 / 0.17),
                  crossAxisCount: 1,
                  children: List.generate(snapshot.data.length, (index) {
                    return userCard(
                        'assets/images/user.png',
                        snapshot.data[index].name +
                            " " +
                            snapshot.data[index].lname,
                        context,
                        snapshot.data[index].idUser);
                  }));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),

      /*GridView.count(
        childAspectRatio: (1 / 0.17),
        crossAxisCount: 1,
        children: List.generate(dataSource.length, (index) {
          return userCard(dataSource[index]['imagen'],
              dataSource[index]['nombre'], context);
        }),
      ),*/
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AniadirSubCuenta()));
        },
        splashColor: colPrimary,
        backgroundColor: colPrimary,
        elevation: 3,
      ),
    );
  }
}

//CELDAS DE INICIO

Widget userCard(String imagen, String nombre, BuildContext context, int id) =>
    Padding(
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
            flex: 4, // 60%
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(nombre),
              ],
            ),
          ),
          Expanded(
            flex: 4, // 20%
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: MaterialButton(
                minWidth: 30.0,
                height: 30.0,
                elevation: 3,
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setInt('idParent', id);
                  //Navigator.of(context).popUntil(ModalRoute.withName('/Login'));
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Inicio()));
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

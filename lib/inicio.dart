import 'package:proyectoubicua2019/aniadir.dart';
import 'drawer.dart';
import 'pastillas.dart';
import 'directorio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'perfil.dart';
import 'package:proyectoubicua2019/db/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:proyectoubicua2019/model/usuario_model.dart';

Future<User> getUser() async {
  final prefs = await SharedPreferences.getInstance();
  // Try reading data from the counter key. If it doesn't exist, return 0.
  int id = prefs.getInt('idParent') ?? 0;
  return await PastilleroDataBaseProvider.db.getUserWithId(id);
}

class Inicio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InicioState();
  }
}

class InicioState extends State<Inicio>  {
  Future<User> user;

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
  void initState() {
    super.initState();
    user = getUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          drawer: 
          FutureBuilder(
            future: user,
            builder: (context, AsyncSnapshot snapshot) {
              if(snapshot.hasData) {
                return CustomDrawer(snapshot.data.name + " " + snapshot.data.lname);
              }
              else {
                return CustomDrawer("Cargando...");
              }
            }
          ),
          
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
                body: Pastillas(),
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Aniadir(false)));
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/db/database.dart';
import 'package:proyectoubicua2019/model/usuario_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User> getUser() async {
  final prefs = await SharedPreferences.getInstance();
  // Try reading data from the counter key. If it doesn't exist, return 0.
  int id = prefs.getInt('idParent') ?? 0;
  return await PastilleroDataBaseProvider.db.getUserWithId(id);
}

class Perfil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PerfilState();
  }
}

class PerfilState extends State<Perfil> {
  Future<User> user;
  static const TextStyle optionStyle = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    user = getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: user,
            builder: (context, AsyncSnapshot snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(1.0), BlendMode.darken),
                            image: AssetImage('assets/images/messi.jpg',),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Row(
                            children: <Widget>[
                              Padding(padding:EdgeInsets.only(left: 20, bottom: 25),),
                              Container(
                                padding: EdgeInsets.only(right: 100),
                                width: 70,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/messi2.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white,width: 5,)
                                ),
                              ),
                              Padding(padding:EdgeInsets.only(left: 20, bottom: 25),),
                              Text(
                                snapshot.data.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 200),),
                      Container(width: 100,),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.save),
                        backgroundColor: Colors.yellow,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          initialValue: snapshot.data.name,
                          decoration: InputDecoration(
                            labelText: "Nombre",
                            hintText: "Ej. Juan",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          initialValue: snapshot.data.lname,
                          decoration: InputDecoration(
                            labelText: "Apellido",
                            hintText: "Ej. Peres",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          initialValue: snapshot.data.email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Correo",
                            hintText: "correo@ejemplo.com",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          initialValue: snapshot.data.mobile,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Numero telefonico",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          initialValue: snapshot.data.gender,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Sexo",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          initialValue: snapshot.data.age,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Edad",
                          ),
                        ),
                      ),
                    ],
                  ),
                ]);
            },
          ),
        ),
      ),
    );
  }
}

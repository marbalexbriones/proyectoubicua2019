import 'package:flutter/cupertino.dart';
import 'package:proyectoubicua2019/aniadir.dart';
import 'inicio.dart';
import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/model/usuario_model.dart';
import 'package:proyectoubicua2019/db/database.dart';

class Pastillas extends StatelessWidget {
  //var dataSource;
  //Pastillas({Key key, @required this.dataSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: FutureBuilder<List<Reminder>>(
        future: PastilleroDataBaseProvider.db.getAllReminders(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Reminder>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Reminder item = snapshot.data[index];

                //delete one register for id
                return Dismissible(
                    key: UniqueKey(),
                    background: Container(color: Colors.teal),
                    onDismissed: (diretion) {
                      PastilleroDataBaseProvider.db
                          .deleteReminderWithId(item.idReminder);
                         /* Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Aniadir(
                          true,
                          //Here is the record that we want to edit
                          reminder: item,                          
                        )                        
                      )
                      );*/
                    },
                    child: customCard(item,
                        "assets/images/pastilla.png",
                        item.medicine,
                        item.quantity + " " + item.unit,
                        "cada " + item.frequency + " horas",
                        item.quantityAva + " disponible",
                        context)

                    /*ListTile(
                    title: Text("Medicamento:" +
                        item.medicine +
                        "       Usuario:" +
                        item.idUser.toString()),
                    subtitle: Text("Catntidad:" +
                        item.quantity +
                        "       Disponible:" +
                        item.quantityAva +
                        "         Frecuencia:" +
                        item.frequency),
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 64,
                        maxHeight: 64,
                      ),
                      child: Image.network(
                        'https://picsum.photos/250?image=9',
                      ),
                    ),
                    //If we press one of the cards, it takes us to the page to edit, with the data onTap:
                    //This method is in the file add_editclient.dart
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddEditUser(
                                true,
                                //Here is the record that we want to edit
                              )));
                    },
                  ),*/
                    );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );

    /*return GridView.count(
      childAspectRatio: (1 / 0.59),
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
    );*/
  }
}

//CELDAS DE INICIO

Widget customCard(Reminder item, String imagen, String nombre, String dosis, String time,
        String restantes, BuildContext context) =>
    Padding(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                     Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Aniadir(
                          true,
                          //Here is the record that we want to edit
                          reminder: item,                          
                        )                        
                      )
                      );
                    },
                    color: Colors.white,
                    child: Text(
                      'Ver / Editar',
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

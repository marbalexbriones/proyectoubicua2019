import 'package:flutter/cupertino.dart';
import 'inicio.dart';
import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/model/usuario_model.dart';
import 'package:proyectoubicua2019/db/database.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                    background: Container(color: col_blue_gray),
                    onDismissed: (diretion) {
                      PastilleroDataBaseProvider.db
                          .deleteReminderWithId(item.idReminder);
                    },
                    child: customCard(
                        "assets/images/pastilla.png",
                        item.medicine,
                        item.quantity + " " + item.unit,
                        "cada " + item.frequency + " horas",
                        item.quantityAva,
                        item.idReminder,
                        context,
                        item)

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

Widget customCard(
        String imagen,
        String nombre,
        String dosis,
        String time,
        String restantes,
        int idPastilla,
        BuildContext context,
        Reminder reminder) =>
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
                    Text(dosis +
                        " | " +
                        time +
                        " | " +
                        restantes +
                        " disponibles."),
                  ],
                ),
              ),
              Center(
                child: Text("Última toma: " +
                    getDateWithFormat(
                        DateTime.parse(reminder.regTime).toString())),
              ),
              Center(
                child: Text("Siguiente toma: " +
                    getDateWithFormat(DateTime.parse(reminder.regTime)
                        .add(new Duration(hours: int.parse(reminder.frequency)))
                        .toString())),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 30.0,
                    height: 30.0,
                    elevation: 5,
                    onPressed: () async {
                      int rest = int.parse(restantes);
                      if (rest >= 1) {
                        rest = rest - 1;
                        setAlarm(
                            reminder.regTime, int.parse(reminder.frequency));
                        reminder.quantityAva = rest.toString();
                        reminder.regTime = new DateTime.now().toString();
                        PastilleroDataBaseProvider.db.updateReminder(reminder);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Inicio()),
                        );
                      } else {
                        Fluttertoast.showToast(
                            msg:
                                'Ya no quedan pastillas disponibles. Edita la cantidad disponible cuando adquieras más medicamento',
                            toastLength: Toast.LENGTH_SHORT);
                      }
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
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

getDateWithFormat(String time) {
  var date = DateTime.parse(time);
  var day;
  switch (date.weekday) {
    case 1:
      day = "Lunes";
      break;
    case 2:
      day = "Martes";
      break;
    case 3:
      day = "Miércoles";
      break;
    case 4:
      day = "Jueves";
      break;
    case 5:
      day = "Viernes";
      break;
    case 6:
      day = "Sábado";
      break;
    case 7:
      day = "Domingo";
      break;
  }

  var hour = date.hour;
  var minute = date.minute.toString();
  var am = "a.m.";
  if (hour > 12) {
    hour -= 12;
    am = "p.m.";
  } else if (hour == 12) {
    am = "p.m.";
  }

  if (minute.toString().length == 1) {
    minute = "0" + minute;
  }

  return day + " a las " + hour.toString() + ":" + minute + am;
}

setAlarm(String time, int lapse) {
  var date = DateTime.parse(time).add(new Duration(hours: lapse));
  Fluttertoast.showToast(
      msg: 'Siguiente alarma programada para el ' +
          getDateWithFormat(date.toString()),
      toastLength: Toast.LENGTH_SHORT);
}

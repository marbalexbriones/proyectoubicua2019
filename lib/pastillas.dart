import 'package:flutter/cupertino.dart';
import 'inicio.dart';
import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/model/usuario_model.dart';
import 'package:proyectoubicua2019/db/database.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_database/firebase_database.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class Pastillas extends StatefulWidget {
  @override
  _MyPastillaState createState() => _MyPastillaState();
}

class _MyPastillaState extends State<Pastillas> {
  var mymap = {};
  var title = '';
  var body = {};
  var mytoken = '';

  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var android = new AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    var platform = new InitializationSettings(android, ios);
    flutterLocalNotificationsPlugin.initialize(platform);

    firebaseMessaging.configure(onLaunch: (Map<String, dynamic> msg) {
      print("onLaunch called ${(msg)}");
    }, onResume: (Map<String, dynamic> msg) {
      print("onResume called ${(msg)}");
    }, onMessage: (Map<String, dynamic> msg) {
      print("onMessage called ${(msg)}");
      mymap = msg;
      showNotification(msg);
    });

    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, alert: true, badge: true));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings setting) {
      print("onIosSettingRegistered");
    });
    firebaseMessaging.getToken().then((token) {
      print(token);
      update(token);
    });
  }

  showNotification(Map<String, dynamic> msg) async {
    var android =
        new AndroidNotificationDetails("1", "pills", "channelDescription");
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);

    //key and value
    msg.forEach((k, v) {
      title = k;
      body = v;
      setState(() {});
    });

    await flutterLocalNotificationsPlugin.show(
        0, "${body.keys}", "${body.values}", platform);
  }

  //fcm-token firebase cloud messagin
  update(String token) {
    print(token);
    DatabaseReference databaseReference = new FirebaseDatabase().reference();
    databaseReference.child('fcm-token/$token').set({"token": token});
    mytoken = token;
    setState(() {});
  }

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
                        sendPush(reminder);
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

sendPush(Reminder reminder) async {
  var url = "https://fcm.googleapis.com/fcm/send";

  var body = json.encode({
    "notification": {
      "title": "Es hora de tu medicamento.",
      "text": "Debes tomarte: ${reminder.medicine}.",
      "sound": "default",
      "badge": "8",
      "color": "#4BCADB"
    },
    "priority": "high",
    "to":
        "cg5tRhyT9Qk:APA91bFFYbFT3V0O6gpJSRtSfmBSyOQ81PaoF9JzEH6jH0AGkTMH6Km1fQUDGpEBXRR-vXQ5UnkZgwwXok98t2BFre7mnpKfJrdPi_8XfoEfe6Qy4KttC3zV97QuCRd594_vNAe5ZeOK"
  });

  Map<String, String> headers = {
    'Authorization':
        'key=AAAACO7jpSA:APA91bGs_JGt9KNlMqs_r1IpHiV67b6a1sapJ9dSLWB-CEysr_kkeFYwVtdVQJSfuhIzoczhrCAEkY2bAgILg1BzglokYkwIKKLHjyiiWxCYeNUs2qfrn3B3S1stq0kHtuyIoL4aM2s0',
    'Content-Type': 'application/json'
  };


  Future.delayed(const Duration(milliseconds: 30000), () async {
      var response = await http.post(url, body: body, headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print("Number of books about http: $itemCount.");
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  });
  // Await the http get response, then decode the json-formatted responce.
  
}

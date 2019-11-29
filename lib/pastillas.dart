import 'package:flutter/cupertino.dart';
import 'package:proyectoubicua2019/aniadir.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<User> getUser() async {
  final prefs = await SharedPreferences.getInstance();
  // Try reading data from the counter key. If it doesn't exist, return 0.
  int id = prefs.getInt('idParent') ?? 0;
  return await PastilleroDataBaseProvider.db.getUserWithId(id);
}

class Pastillas extends StatefulWidget {
  @override
  _MyPastillaState createState() => _MyPastillaState();
}

class _MyPastillaState extends State<Pastillas> {
  var mymap = {};
  var title = '';
  var body = {};
  var mytoken = '';
  Future<User> user;

  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
    user = getUser();

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
      print("Token = " + token);
      update(token);
    });
  }

  showNotification(Map<String, dynamic> msg) async {
    var android =
        new AndroidNotificationDetails("1", "pills", "channelDescription", color: col_primary);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);

    //key and value
    msg.forEach((k, v) {
      title = k;
      body = v;
      setState(() {});
    });

    await flutterLocalNotificationsPlugin.show(
        0, "Es hora de tomar alguna pastilla.", "Ve al inicio para comprobar", platform);
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
        child: (FutureBuilder<User>(
            future: user,
            builder: (BuildContext context, AsyncSnapshot<User> userUR) {
              if (userUR.hasData) {
                return FutureBuilder(
                    future: PastilleroDataBaseProvider.db
                        .getAllRemindersFromId(userUR.data.idUser),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Reminder>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Reminder item = snapshot.data[index];
                            print(item.regTime.toString());

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
                                    item, mytoken));
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })));

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
        Reminder reminder, String token) =>
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
                        sendPush(reminder, token);
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Aniadir(
                                true,
                                //Here is the record that we want to edit
                                reminder: reminder,
                              )));
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

sendPush(Reminder reminder, String token) async {
  User user = await getUser();
  var url = "https://fcm.googleapis.com/fcm/send";

  var body = json.encode({
    "notification": {
      "title": "Es hora de un medicamento",
      "text": " ${user.name} ${user.lname} debe tomar ${reminder.medicine}.",
      "sound": "default",
      "badge": "8",
      "color": "#4BCADB"
    },
    "priority": "high",
    "to":"$token"
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

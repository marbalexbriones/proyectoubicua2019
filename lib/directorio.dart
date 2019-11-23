import 'package:flutter/cupertino.dart';
import 'inicio.dart';
import 'colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Directorio extends StatelessWidget {
  var dataSource;
  Directorio({Key key, @required this.dataSource}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: (1 / 0.17),
      crossAxisCount: 1,
      children: List.generate(dataSource.length, (index) {
        return doctorCard(
            dataSource[index]['imagen'],
            dataSource[index]['nombre'],
            dataSource[index]['lugar'],
            dataSource[index]['telefono'],
            context);
      }),
    );
  }
}

//CELDAS DE INICIO

Widget doctorCard(String imagen, String nombre, String lugar, String telefono,
        BuildContext context) =>
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
            flex: 5, // 60%
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(nombre),
                Text(lugar),
                Text(telefono),
              ],
            ),
          ),
          Expanded(
            flex: 3, // 20%
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: MaterialButton(
                minWidth: 30.0,
                height: 30.0,
                elevation: 3,
                onPressed: () {
                  
                  _launchCaller(telefono);
                },
                color: col_primary,
                child: Text(
                  'Llamar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      )),
    );


    _launchCaller(tel) async {
    var url = "tel:" + tel;   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   
}

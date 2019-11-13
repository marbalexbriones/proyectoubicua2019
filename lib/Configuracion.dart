import 'package:flutter/material.dart';
import 'colors.dart';

void main() => runApp(Configuracion());

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Configuracion'),
        ),
        body: Card(
          child: Center(
              child: Column(
                children: <Widget>[


                  Container(

                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),

                    child:MaterialButton(
                      padding: EdgeInsets.fromLTRB(0, 0, 110, 0),
                      minWidth: 400.0,
                      height: 60.0,

                      onPressed: () {},
                      color: col_light_gray,


                      child: Text('Config 1',
                        style: TextStyle(color: col_primary,fontSize: 23,), ),

                    ),


                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child:MaterialButton(

                      padding: EdgeInsets.fromLTRB(0, 0, 110, 0),
                      minWidth: 400.0,
                      height: 60.0,
                      onPressed: () {},
                      color: col_light_gray,


                      child: Text('Config 2',
                        style: TextStyle(color: col_primary,fontSize: 23,), ),

                    ),
                  ),
                ],
              )

          ),

        ),
      ),
    );

  }}
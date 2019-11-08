import 'package:flutter/material.dart';

class Aviso extends StatefulWidget {
  @override
  _AvisoState createState() => _AvisoState();
}

class _AvisoState extends State<Aviso> {
  List<Color> colores = [Colors.white, Colors.cyan, Colors.black87];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Aviso"),),
      body: Container( 
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colores,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 80.0),
                  child: Text("Hora de tomar", style: TextStyle(fontSize: 40)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text("Paracetamoles :v 15g", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
           
            Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 100.0),
                child: Text("0:02s", style: TextStyle(fontSize: 60, color: Colors.white)),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text("de retraso", style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ],),

            
            
            Container(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: null,
                    child: Icon(Icons.watch_later),
                    backgroundColor: Colors.orange,
                    onPressed: (){},
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    child: Icon(Icons.check),
                    backgroundColor: Colors.green,
                    onPressed: (){},
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    child: Icon(Icons.cancel),
                    backgroundColor: Colors.red,
                    onPressed: (){},
                  ),
                ],
              ),
            )
            
          ],
        ),
      )
    );
  }
}
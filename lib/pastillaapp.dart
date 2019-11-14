import 'package:flutter/material.dart';
import 'colors.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'PastillaApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int present = 0;
  int perPage = 8;

  final originalItems = List<String>.generate(1, (i) => "Item $i");
  var items = List<Container>();
  Widget creacontainer(){
    return Container(
      width:180,
      height: 270,
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              width:200,
              height: 100,
              decoration: BoxDecoration(
                color: col_primary,

              ),
              child: Image(image: AssetImage('Assets/Images/pastilla.jpg'),width: 200,height: 200,),

            ),
            ListTile(
              title: Text('Nombre de Pastilla'),
              subtitle: Text('500gm | Cada 8 Horas | 25 restantes'),
            ),
            RaisedButton(
              child:
              Text('Tomar',style: TextStyle(color: Colors.white),)
              ,onPressed: (){},color: col_primary,),
            RaisedButton(
              child:
              Text('Editar',style: TextStyle(color: col_primary),)
              ,onPressed: (){},color: Colors.white,),
          ],
        ),
      ),
    );
  }




  @override
  void initState() {
    super.initState();
    setState(() {
      items.add(creacontainer());
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Wrap(children: items),


      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),backgroundColor: col_primary,
        onPressed: (){setState(() {
          items.add(creacontainer());
          print('hola');
        });},
      ),
    );

  }
}

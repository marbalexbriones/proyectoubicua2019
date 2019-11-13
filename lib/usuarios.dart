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
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
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
  var items = List<Card>();


  @override
  void initState() {
    super.initState();
    setState(() {
      items.add(new Card(
        child:Column(
          children: <Widget>[

            ListTile(
              leading: Image(image: AssetImage('assets/images/pastilla.jpg'),
                width: 90,
                height: 90,
              ),
              title: Text('Usuario'),
              subtitle: Text('Toma Pastilla'),
              trailing: RaisedButton(child:
              Text('Seleccionar',style: TextStyle(color: col_primary),)
                ,onPressed: (){},color: col_primary,),
            )
          ],
        ),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: (present <= originalItems.length) ? items.length + 1 : items.length,
        itemBuilder: (context, index) {
          return (index == items.length ) ?
          Card(
            child: Column(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      items.add(Card());
                    });

                  },
                  child: Icon(Icons.add),
                  backgroundColor: col_primary,
                ),
              ],
            ),
          )
              :
          ListTile(
            leading: Image(image: AssetImage('Assets/Images/pastilla.jpg'),
              width: 90,
              height: 90,
            ),
            title: Text('Usuario'),
            subtitle: Text('Toma Pastilla'),
            trailing: RaisedButton(child:
            Text('Seleccionar',style: TextStyle(color: Colors.white),)
              ,onPressed: (){},color: Colors.blue,),
          );
        },
      ),
    );
  }
}
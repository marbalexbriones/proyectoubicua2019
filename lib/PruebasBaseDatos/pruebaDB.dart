import 'package:flutter/material.dart';
import 'package:proyectoubicua2019/PruebasBaseDatos/addUsuario.dart';



import 'package:proyectoubicua2019/model/usuario_model.dart';
import 'package:proyectoubicua2019/db/database.dart';




class Prueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Probando Bae datos',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
@override
void didUpdateWidget(MyHomePage oldWidget){
  super.didUpdateWidget(oldWidget);
  setState(() {
    
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Probando base datos"),
        actions: <Widget>[
          RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: (){
              PastilleroDataBaseProvider.db.deleteAllReminder();
              setState(() {
                
              });
            },
            child: Text("Delete ALL",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Colors.black
            ),  
            ),
          )
        ],
      ),
      body: 
      FutureBuilder<List<Reminder>>(
        future: PastilleroDataBaseProvider.db.getAllReminders(),
        builder: (BuildContext context, AsyncSnapshot<List<Reminder>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                Reminder item = snapshot.data[index];
                
                //delete one register for id
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.teal),
                  onDismissed: (diretion) {
                   PastilleroDataBaseProvider.db.deleteReminderWithId(item.idReminder);
                  },
                  child: ListTile(
                    title: Text("Medicamento:"+item.medicine + "       Usuario:" + item.idUser.toString()),
                    subtitle: Text("Catntidad:" + item.quantity + "       Disponible:" + item.quantityAva + "         Frecuencia:" + item.frequency),
                    leading:  ConstrainedBox(constraints: BoxConstraints(minWidth: 44,minHeight: 44,maxWidth: 64,maxHeight: 64,),
                    child: Image.network('https://picsum.photos/250?image=9',),
                    ),
                    //If we press one of the cards, it takes us to the page to edit, with the data onTap:
                    //This method is in the file add_editclient.dart
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddEditUser(
                          true,
                          //Here is the record that we want to edit
                                                   
                        )                        
                      )
                      );
                    },
                  
                  ),
                  
                );
              },
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_bulleted),
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddEditUser(false)));
        },
      ),
    );
  }
}
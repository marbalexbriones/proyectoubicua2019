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
              PastilleroDataBaseProvider.db.deleteAllUser();
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
      FutureBuilder<List<User>>(
        future: PastilleroDataBaseProvider.db.getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                User item = snapshot.data[index];
                //delete one register for id
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (diretion) {
                   PastilleroDataBaseProvider.db.deleteReminderWithId(item.idUser);
                  },
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.lname),
                    leading: CircleAvatar(child: Text(item.idUser.toString())),
                    //If we press one of the cards, it takes us to the page to edit, with the data onTap:
                    //This method is in the file add_editclient.dart
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddEditUser(
                          true,
                          //Here is the record that we want to edit
                          user: item,                          
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
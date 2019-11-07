import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Perfil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PerfilState();
  }
}

class PerfilState extends State<Perfil> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Perfil")),
      body: Form(child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    hintText: "Ej. Juan",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Apellido",
                    hintText: "Ej. Peres",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Correo",
                    hintText: "correo@ejemplo.com",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Numero telefonico",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Sexo",
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Edad",
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Comeentarios"
                  ),
                  obscureText: true,
                ),
              ),
              Text("Ayuda"),
              Center(
                child: RaisedButton(
                  color: Colors.cyanAccent,
                  child: Text("Registrarse"),
                  onPressed: (){},
                ),
              )
            ],
          ),
        ),
      ),),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
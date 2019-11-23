import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Perfil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PerfilState();
  }
}

// class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.cyan,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           CircleAvatar(
//             backgroundImage: NetworkImage("https://picsum.photos/300"),
//             minRadius: 30, maxRadius: 60,
//           ),
//           Text("hola"),
//           Text("hola"),

//         ],
//       )
//     );
//   }

//   @override
//   Size get preferredSize => Size(double.infinity, 200);

// }

// class MyAppBar extends PreferredSize {
//   MyAppBar({Key key, Widget title}) : super(
//     key: key,
//     preferredSize: Size(double.infinity, 200),
//     child: AppBar(
//       title: title,
//       leading: Column(
//         children: <Widget>[
//           CircleAvatar(
//             backgroundImage: NetworkImage("https://picsum.photos/300"),
//             minRadius: 30, maxRadius: 60,
//           ),
//         ],

//       ),
//       // maybe other AppBar properties
//     ),
//   );
// }

class PerfilState extends State<Perfil> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Wrap(
        children: <Widget>[
          Column(
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
                  decoration: InputDecoration(labelText: "Comentarios"),
                  obscureText: true,
                ),
              ),
              Text("Ayuda"),
              Center(
                child: RaisedButton(
                  color: Colors.cyanAccent,
                  child: Text("Registrarse"),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

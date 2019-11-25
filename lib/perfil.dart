import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Perfil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PerfilState();
  }
}


class PerfilState extends State<Perfil> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.bold);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: Form(
    child: SingleChildScrollView(

    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Row(children: <Widget>[
    Expanded(
    child:Container(
    height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/user_bg.jpg', ),
          fit:BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 80),
        child: Row(children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 20,bottom:25),),
          Container(
            padding: EdgeInsets.only(right: 100),
            width: 70,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/user.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                )
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 20,bottom:25),),
          Text("Nombre Usuario",style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold),),
        ],),
      ) ,
    ),

    )
      ],),
      Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 200),),
          Container(
            width: 100,


          ),
          FloatingActionButton(onPressed:(){

          },
            child: Icon(Icons.save),
            backgroundColor: Colors.yellow,
          ),
        ],
      ),
      Wrap(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Container(
                padding: EdgeInsets.only(left: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    hintText: "Ej. Juan",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Apellido",
                    hintText: "Ej. Peres",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Correo",
                    hintText: "correo@ejemplo.com",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Numero telefonico",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Sexo",
                  ),

                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Edad",
                  ),

                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Comentarios",
                      hintText: "Asma hereditaria,Alergia: al gluten"
                  ),
                ),
              ),

              
            ],
          ),
        ],
      ),


    ]
    ),

    ),
    ),

    );
  }
}

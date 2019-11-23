import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'db/database.dart';
import 'model/usuario_model.dart';

class Aniadir extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AniadirState();
  }
}


class AniadirState extends State<Aniadir> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,

            actions: <Widget>[
              IconButton(icon: Icon(Icons.save), onPressed: () {},),
              IconButton(icon: Icon(Icons.delete), onPressed: () {},)
            ],
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Aniadir",),
              background: Image.network("https://cdn.forbes.com.mx/2019/07/medicina-pildoras-pastillas-cancer-640x360.jpg", fit: BoxFit.cover),
            )
          ),
          SliverFillRemaining(
            child: Container(
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
                              labelText: "Nombre Medicamento",
                              hintText: "Paracetamol",
                            ),
                          ),
                        ),
                       
                        Row(
                      children: <Widget>[
                        Expanded(
                          child:  Container(
                          padding: EdgeInsets.only(bottom: 10.0),

                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Cantidad",
                              hintText: "5000",
                            ),
                            
                          ),
                          
                          
                        ),

                        ),
                        Expanded(
                          child:  Container(
                          padding: EdgeInsets.only(bottom: 10.0,left: 10.0),

                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Unidad",
                              hintText: "miligramos(mg)",
                            ),
                            
                          ),
                          
                          
                        ),

                        ),
                      ],
                    ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Frecuencia",
                              hintText: "Cada 8 Horas",
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Cantidad Disponible",
                              hintText: "25 Unidades",
                            ),
                            obscureText: true,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Indicaciones Especiales",
                              hintText: "Ninguna",
                            ),
                          ),
                        ),
                        
                        Text("Ayuda"),
                        Center(
                          child: RaisedButton(
                            color: Colors.cyanAccent,
                            child: Text("Aceptar"),
                            onPressed: (){},
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text('Alarmas'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            title: Text('Directorio'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PastillAppNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text('Alarmas'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            title: Text('Directorio'),
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan,
        //onTap: _onItemTapped,
      );
  }
}

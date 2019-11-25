import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';

class Acerca extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AcercaState();
  }
}


class AcercaState extends State<Acerca> {
  // int _selectedIndex = 0;
  // static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Acerca de"),
          backgroundColor: Colors.cyan,
        ),
      body: Center(
        child: Container(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                width: 200,
                height: 200,
              ),
              SizedBox(height: 5.0),

              Padding(
                padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 8.0),
                child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sodales lectus dolor, sed sollicitudin libero suscipit sed. Nunc auctor lorem at ante tincidunt, tempus lobortis est semper. Maecenas sapien nisl, consectetur non nulla a, cursus sodales mi. Mauris consequat lacus non viverra volutpat. Vestibulum sit amet feugiat ex. Donec interdum ligula eu tincidunt gravida. Nam aliquam libero non accumsan euismod. Aenean vitae vulputate libero, vel finibus nisl. Phasellus cursus sapien odio, sit amet viverra neque egestas sed. Quisque id maximus velit. Duis bibendum, felis ac eleifend ultricies, erat elit rhoncus urna, sit amet ultrices tortor nisi vulputate metus.",
                style: TextStyle(
                    color: col_blue_gray,
                    fontSize: 20,
                    fontFamily: 'GoogleSans'),
                    textAlign: TextAlign.center
              )),
              
            ],
          ),
        ),
      ),
      
    );
  }
}

class CustomBottonNavigationBar extends BottomNavigationBar {
   
}

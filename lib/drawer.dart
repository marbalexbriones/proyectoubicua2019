import 'package:flutter/material.dart';
import 'package:proyectoubicua2019/AcercaDe.dart';
import 'package:proyectoubicua2019/Configuracion.dart';
import 'package:proyectoubicua2019/aniadir.dart';
import 'package:proyectoubicua2019/Ayuda.dart';
import 'package:proyectoubicua2019/pastillaapp.dart';
import 'package:proyectoubicua2019/usuarios.dart';

class CustomDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.add_alarm,
              text: 'Añadir Alarma',
              onTap: "Aniadir",
              context: context),
          _createDrawerItem(
              icon: Icons.group,
              text: 'Usuarios',
              onTap: "Usuarios",
              context: context),
          _createDrawerItem(
              icon: Icons.settings,
              text: 'Configuracion',
              onTap: "Configuracion",
              context: context),
          Divider(),
          _createDrawerItem(
              icon: Icons.info,
              text: 'Acerca De',
              onTap: "Acercade",
              context: context),
          _createDrawerItem(
              icon: Icons.error,
              text: 'Ayuda',
              onTap: "Ayuda",
              context: context),
          Divider(),
          _createDrawerItem(
              icon: Icons.cancel,
              text: 'Cerrar Sesión',
              onTap: "CerrarSesion",
              context: context),
          ListTile(
            title: Text('0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/header_drawer.jpg'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Nombre de Usuario",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}

Widget _createDrawerItem(
    {IconData icon, String text, String onTap, BuildContext context}) {
  return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: () {
        switch (onTap) {
          case "Aniadir":
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Aniadir()));
            break;
          case "Usuarios":
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Usuarios()));
            break;
          case "Configuracion":
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Configuracion()));
            break;
          case "Acercade":
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Acerca()));
            break;
          case "Ayuda":
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Ayuda()));
            break;
          case "CerrarSesion":
            /*Navigator.push(
                context, MaterialPageRoute(builder: (context) => Aniadir()));*/
            break;
        }
      });
}

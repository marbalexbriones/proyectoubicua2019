import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/db/database.dart';
import 'package:proyectoubicua2019/model/usuario_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Perfil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PerfilState();
  }
}

class PerfilState extends State<Perfil> {
  Future<User> user;
  static const TextStyle optionStyle = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);

  TextEditingController nameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String password;
  int userId;
  int parentID;

Future<User> getUser() async {
  final prefs = await SharedPreferences.getInstance();
  // Try reading data from the counter key. If it doesn't exist, return 0.
  int id = prefs.getInt('idParent') ?? 0;
  var a = await PastilleroDataBaseProvider.db.getUserWithId(id);
  password = a.password;
  userId = a.idUser;
  parentID = a.parent_id;
  nameController.text = a.name;
  lnameController.text = a.lname;
  emailController.text = a.email;
  phoneController.text = a.mobile;
  genderController.text = a.gender;
  ageController.text = a.age;
  return a;
}

  @override
  void initState() {
    super.initState();
    user = getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: user,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(1.0), BlendMode.darken),
                            image: AssetImage('assets/images/user_bg.jpg',),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 80),
                          child: Row(
                            children: <Widget>[
                              Padding(padding:EdgeInsets.only(left: 20, bottom: 25),),
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
                                  border: Border.all(color: Colors.white,width: 5,)
                                ),
                              ),
                              Padding(padding:EdgeInsets.only(left: 20, bottom: 25),),
                              Text(
                                snapshot.data.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 200),),
                      Container(width: 100,),
                      FloatingActionButton(
                        onPressed: _saveUser,
                        child: Icon(Icons.save),
                        backgroundColor: Colors.yellow,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          // initialValue: snapshot.data.name,
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Nombre",
                            hintText: "Ej. Juan",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          // initialValue: snapshot.data.lname,
                          controller: lnameController,
                          decoration: InputDecoration(
                            labelText: "Apellido",
                            hintText: "Ej. Peres",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          // initialValue: snapshot.data.email,
                          controller: emailController,
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
                          // initialValue: snapshot.data.mobile,
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Numero telefonico",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          // initialValue: snapshot.data.gender,
                          controller: genderController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Sexo",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: TextFormField(
                          // initialValue: snapshot.data.age,
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Edad",
                          ),
                        ),
                      ),
                    ],
                  ),
                ]);
              }
              else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  void _saveUser() async {

    PastilleroDataBaseProvider.db.updateUser(new User(
        idUser: userId,
        name: nameController.text,
        lname: lnameController.text,
        email: emailController.text,
        password: password,
        mobile: phoneController.text,
        gender: genderController.text,
        age: ageController.text,
        parent_id: parentID,
    ));
        Navigator.pop(context);
  }
}
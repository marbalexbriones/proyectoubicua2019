import 'package:flutter/material.dart';
import 'package:proyectoubicua2019/model/usuario_model.dart';
import 'package:proyectoubicua2019/db/database.dart';


class AddEditUser extends StatefulWidget {
  final bool edit;
  final User user;
  AddEditUser(this.edit, {this.user})
  : assert(edit == true || user == null);

  @override
  _AddEditUserState createState() => _AddEditUserState();
}

class _AddEditUserState extends State<AddEditUser> {
  TextEditingController nameEditingController = TextEditingController(); // para capturar datos
  TextEditingController lnameEditingController = TextEditingController(); 
  TextEditingController emailEditingController = TextEditingController(); 
  TextEditingController passEditingController = TextEditingController(); 
  TextEditingController mobileEditingController = TextEditingController(); 
  TextEditingController genderEditingController = TextEditingController(); 
  TextEditingController ageEditingController = TextEditingController(); 
  TextEditingController commentsEditingController = TextEditingController(); 
  final _formKay = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    if(widget.edit == true){
      nameEditingController.text = widget.user.name;
      lnameEditingController.text = widget.user.lname ; 
      emailEditingController.text = widget.user.email ; 
      passEditingController.text = widget.user.password ; 
      mobileEditingController.text = widget.user.mobile; 
      genderEditingController.text = widget.user.gender; 
     // ageEditingController.text = widget.user.age;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.edit? "Editar Usuario": "Add user"),),
      body:Form(
        key: _formKay,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: 300,
                ),
                
                textFormField(nameEditingController, "Name","En",
                Icons.person, widget.edit ? widget.user.name : "name"),

                textFormField(lnameEditingController, "Last Name","En",
                Icons.person, widget.edit ? widget.user.lname : "Last name"),

                textFormField(emailEditingController, "mail","En",
                Icons.person, widget.edit ? widget.user.email : "mail"),

                textFormField(passEditingController, "pass","En",
                Icons.person, widget.edit ? widget.user.password : "pass"),

                textFormFieldNumber(mobileEditingController, "mobile","En",
                Icons.person, widget.edit ? widget.user.mobile: "mobile"),

                textFormField(genderEditingController, "Gender","En",
                Icons.person, widget.edit ? widget.user.gender : "Gender"),

                textFormFieldNumber(ageEditingController, "Age","En",
                Icons.person, widget.edit ? widget.user.age: "Age"),

                //textFormField(commentsEditingController, "coments","En",
               // Icons.person, widget.edit ? widget.user.comments: "coments"),
                RaisedButton(
                  color: Colors.amberAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Text("Save",
                    style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.white
                  ),
                  ),
                  onPressed: ()async{
                    if(!_formKay.currentState.validate()){
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Procesin data"))
                      );
                    }else if(widget.edit == true){
                      /* PastilleroDataBaseProvider.db.uopdateUser(new User(
                        name: nameEditingController;
                        update

                      ));
                      Navigator.*/

                    }else{
                      await PastilleroDataBaseProvider.db.addUserToDatabase(new User(
                        name: nameEditingController.text,
                        lname: lnameEditingController.text,
                        email: emailEditingController.text,
                        password: passEditingController.text,
                        mobile: mobileEditingController.text,
                        gender: genderEditingController.text,
                       // age: ageEditingController.text,
                      ));
                      Navigator.pop(context);
                    }
                  },
                  
                )
              ],
            ),
          ),
        ),
      )
    );
  }

 textFormField(TextEditingController t, String label, String hint,
    IconData iconData, String initialValue) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: TextFormField(
          validator: (value){
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          controller: t,
          //keyboardType: TextInputType.number,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            prefixIcon: Icon(iconData),            
            hintText: label,
            border: 
              OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ),
        ),
      );
    }

    textFormFieldNumber(TextEditingController t, String label, String hint,
    IconData iconData, String initialValue) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: TextFormField(
          validator: (value){
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          controller: t,
          keyboardType: TextInputType.number,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            prefixIcon: Icon(iconData),            
            hintText: label,
            border: 
              OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ),
        ),
      );
    }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyectoubicua2019/colors.dart';
import 'package:proyectoubicua2019/PruebasBaseDatos/pruebaDB.dart';

import 'db/database.dart';
import 'model/usuario_model.dart';

class Aniadir extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AniadirState();
  }
}

class AniadirState extends State<Aniadir> {
  TextEditingController idUserEditingController = TextEditingController(); // para capturar datos
  TextEditingController medicineEditingController = TextEditingController(); 
  TextEditingController quantityEditingController = TextEditingController(); 
  TextEditingController unitEditingController = TextEditingController(); 
  TextEditingController regTimeEditingController = TextEditingController(); 
  TextEditingController frecuencyEditingController = TextEditingController(); 
  TextEditingController quanAvaEditingController = TextEditingController(); 
  TextEditingController indicationEditingController = TextEditingController(); 

  
  final _formKay = GlobalKey<FormState>();
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Añadir Pastilla"),
           backgroundColor: colPrimary,
          ),
        body: Form(
          key: _formKay,
          child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: TextFormField(
                        controller: medicineEditingController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontFamily: "GoogleSans"),
                          labelText: "Nombre del Medicamento:",
                          hintText: "ej. Paracetamol",
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                              controller: quantityEditingController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(fontFamily: "GoogleSans"),
                                labelText: "Cantidad:",
                                hintText: "1",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
                            child: TextFormField(
                              controller: unitEditingController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(fontFamily: "GoogleSans"),
                                labelText: "Unidad:",
                                hintText: "ej. Miligramos(mg)",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: false,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: TextFormField(
                          controller: regTimeEditingController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(fontFamily: "GoogleSans"),
                            labelText: "Hora de Registro:",
                            hintText: "Automatico del sistema",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: TextFormField(
                        controller: frecuencyEditingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontFamily: "GoogleSans"),
                          labelText: "Frecuencia (Horas):",
                          hintText: "8",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: TextFormField(
                        controller: quanAvaEditingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontFamily: "GoogleSans"),
                          labelText: "Disponibles:",
                          hintText: "25",
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: TextFormField(
                        controller: indicationEditingController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(fontFamily: "GoogleSans"),
                          labelText: "Indicaciones:",
                          hintText: "ej. No tomar en ayunas.",
                        ),
                      ),
                    ),
                    MaterialButton(
                      elevation: 5,
                      onPressed: _createReminder,
                      color: colPrimary,
                      child: Text(
                        'Aniade',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      child: Text("pastillas"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Prueba()));
                      },
                    ),
                  ],
                )),
          ),
        ));
  }



  void _createReminder () async {
    if(!_formKay.currentState.validate()){
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text("Procesing data"))
      );
    }
    else {
      // Si no existe
      Reminder r = new Reminder(
        idUser: 1,
        medicine: medicineEditingController.text,
        quantity: quantityEditingController.text,
        unit: unitEditingController.text,
        regTime: regTimeEditingController.text,
        frequency: frecuencyEditingController.text,
        quantityAva: quantityEditingController.text,
        indication: indicationEditingController.text,
      );

      await PastilleroDataBaseProvider.db.addReminderToDatabase(r);
      Navigator.pop(context);
    }
  }

 




  


 
}

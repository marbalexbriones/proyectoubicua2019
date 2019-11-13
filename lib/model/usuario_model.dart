class User{
  int idUser;
  String name;
  String lname;
  String email;
  String password;
  String celular;
  String sexo;
  String edad;
  String comentarios;

  User ({this.idUser, this.name, this.lname, this.email, this.password, this.celular, this.sexo,this.edad,this.comentarios});

  //To insert the data in the bd, we need to convert it into a Map
  //Para insertar los datos en la bd, necesitamos convertirlo en un Map
  Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "name ":name,
        "lname":lname,
        "email":email,
        "password":password,
        "mobile":celular,
        "sex":sexo,
        "age":edad,
        "comments":comentarios,
  };

  //to receive the data we need to pass it from Map to jsons
  //para recibir los datos necesitamos pasarlo de Map a json
  factory User.fromMap(Map<String, dynamic> json) => new User(
        idUser: json["idUser"],
        name: json ["name"],
        lname: json ["lname"],
        email: json ["email"],
        password: json ["password"],
        celular: json ["mobile"],
        sexo: json ["sex"],
        edad: json ["age"],
        comentarios: json ["comments"],
    );
}

class Reminder{
  int idReminder;
  int idUser;
  String medicine;
  String quantity;
  String unit;
  String frequency;
  String quantityAva;
  String indication;
  

  Reminder ({this.idReminder, this.idUser, this.medicine, this.quantity, this.unit, this.frequency, this.quantityAva,this.indication});

  //To insert the data in the bd, we need to convert it into a Map
  //Para insertar los datos en la bd, necesitamos convertirlo en un Map
  Map<String, dynamic> toMap() => {
        "idReminder": idReminder,
        "idUser":idUser,
        "medicine":medicine,
        "quantity":quantity,
        "unit":unit,
        "frequency":frequency,
        "quantityAva":quantityAva,
        "indication":indication,
        
  };

  //to receive the data we need to pass it from Map to jsons
  //para recibir los datos necesitamos pasarlo de Map a json
  factory Reminder.fromMap(Map<String, dynamic> json) => new Reminder(
        idReminder: json["idReminder"],
        idUser: json ["idUser"],
        medicine: json ["medicine"],
        quantity: json ["quantity"],
        unit: json ["unit"],
        frequency: json ["frequency"],
        quantityAva: json ["quantityAva"],
        indication: json ["indication"],
        
    );
}
class User{
  int idUser;
  String name;
  String lname;
  String email;
  String password;
  String mobile;
  String gender;
  String age;
  int parent_id;

  User ({this.idUser, this.name, this.lname, this.email, this.password, this.mobile, this.gender,this.age, this.parent_id});

  //To insert the data in the bd, we need to convert it into a Map
  //Para insertar los datos en la bd, necesitamos convertirlo en un Map
  Map<String, dynamic> toMap() => {
        "idUser": idUser,
        "name ":name,
        "last_name":lname,
        "email":email,
        "password":password,
        "mobile":mobile,
        "gender":gender,
        "age":age,
        "parent_id": parent_id,
  };

  //to receive the data we need to pass it from Map to jsons
  //para recibir los datos necesitamos pasarlo de Map a json
  factory User.fromMap(Map<String, dynamic> json) => new User(
        idUser: json["idUser"],
        name: json ["name"],
        lname: json ["last_name"],
        email: json ["email"],
        password: json ["password"],
        mobile: json ["mobile"],
        gender: json ["gender"],
        age: json ["age"],
        parent_id: json["parent_id"],
    );
}

class Reminder{
  int idReminder;
  int idUser;
  String medicine;
  String quantity;
  String unit;
  String regTime;
  String frequency;
  String quantityAva;
  String indication;
  

  Reminder ({this.idReminder, this.idUser, this.medicine, this.quantity, this.unit,this.regTime, this.frequency, this.quantityAva,this.indication});

  //To insert the data in the bd, we need to convert it into a Map
  //Para insertar los datos en la bd, necesitamos convertirlo en un Map
  Map<String, dynamic> toMap() => {
        "idReminder": idReminder,
        "idUser":idUser,
        "medicine":medicine,
        "quantity":quantity,
        "unit":unit,
        "RegTime":regTime ,
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
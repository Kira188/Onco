class UserModel {
  String? uid;
  String? phone;
  //String? email;
  String? firstName;
  String? genderField;
  //String? secondName;
  String? ageField;

  UserModel(
      {this.uid,
      this.phone,
      //this.email,
      this.firstName,
      this.genderField,
      //this.secondName,
      this.ageField});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        phone: map['phone'],
        //email: map['email'],
        firstName: map['firstName'],
        genderField: map['genderField'],
        //secondName: map['secondName'],
        ageField: map['ageField']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'phone': phone,
      //'email': email,
      'firstName': firstName,
      'genderField': genderField,
      //'secondName': secondName,
      'ageField': ageField
    };
  }
}
class UserModel {
  String? uid;
  String? email;
  String? fullName;
  String? password;
  UserModel({this.uid, this.email, this.fullName, this.password});
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        fullName: map['firstName'],
        password: map['password']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'password': password
    };
  }
}

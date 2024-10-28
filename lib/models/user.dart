class UserModel {
  String name;
  String email;
  String password;
  String age;
  int id;

  UserModel(
      {required this.name,
      required this.age,
      required this.email,
      required this.id,
      required this.password});



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'age': age,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      age: map['age'],
    );
  }
}
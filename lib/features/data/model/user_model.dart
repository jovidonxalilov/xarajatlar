class UserModel {
  final String id;
  final String name;
  final int age;
  final String email;
  final String phone;
  final String password;

  UserModel({
    required this.name,
    required this.id,
    required this.password,
    required this.age,
    required this.email,
    required this.phone,
  });

  UserModel copyWith(
      {String? id,
      String? name,
      int? age,
      String? email,
      String? phone,
      String? password}) {
    return UserModel(
      name: name ?? this.name,
      id: id ?? this.id,
      password: password ?? this.password,
      age: age ?? this.age,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      id: json['id'],
      password: json['password'].toString(),
      age: json['age'],
      email: json['email'],
      phone: json['phone'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "password": password,
      "age": age,
      "phone": phone,
      "email": email,
    };
  }
}

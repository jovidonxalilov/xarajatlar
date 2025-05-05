class AuthModel {
  final String token;
  final String email;
  final String refreshToken;
  final int expiresIn;
  final String id;

  AuthModel({
    required this.email,
    required this.id,
    required this.refreshToken,
    required this.expiresIn,
    required this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      id: json['localId'],
      refreshToken: json['refreshToken'],
      expiresIn: int.parse(json['expiresIn']),
      token: json['idToken'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "idToken": token,
      "enail": email,
      "refreshToken": refreshToken,
      "expiresIn": expiresIn.toString(),
      "localId": id
    };
  }
}

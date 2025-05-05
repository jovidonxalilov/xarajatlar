// import 'dart:convert';
//
// import 'package:uz_taxi/core/data/model/user_model.dart';
// import 'package:http/http.dart' as http;
//
// class UserRemoteDataSource {
//   Future<UserModel?> login({
//     required String email,
//     required String password,
// }) async {
//     final uri = Uri.parse("https://jovidon-5db27-default-rtdb.asia-southeast1.firebasedatabase.app/user.json",);
//     final response = await http.get(uri);
//     final decodedData = jsonDecode(response.body);
//     UserModel? user;
//     decodedData.forEach((key, value) {
//       print("key: $key");
//       print("value: $value");
//       final currentEmail = value['email'];
//       final currentPassword = value['password'].toString();
//       if(currentEmail == email && currentPassword == password) {
//         value['id'] = key;
//         user = UserModel.fromJson(value);
//         return;
//       }
//     });
//     return user;
//   }
// }
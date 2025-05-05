import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../features/data/model/auth_model.dart';

class AuthDatasource {

  final String _myApiKey = "AIzaSyDhsZG0IC4zuF0PQgDDTTXNMMNBqMO_mvY";
  Future<AuthModel> register({
    required String email,
    required String password,
}) async {
  try {
    final url = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_myApiKey");

    final data  = {"email": email, "password": password, "returnSecureToken": true};
    final response = await http.post(url, body: jsonEncode(data));
    final decodeData = jsonDecode(response.body);
    if (decodeData["error"] != null) {
      throw Exception(decodeData["error"]["message"]);
    }
    final authModel = AuthModel.fromJson(decodeData);
    return authModel;
  } catch (e) {
    print(e);
    rethrow;
  }
  }


  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_myApiKey");

      final data  = {"email": email, "password": password, "returnSecureToken": true};
      final response = await http.post(url, body: jsonEncode(data));
      final decodeData = jsonDecode(response.body);
      if (decodeData["error"] != null) {
        throw Exception(decodeData["error"]["message"]);
      }
      final authModel = AuthModel.fromJson(decodeData);
      return authModel;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

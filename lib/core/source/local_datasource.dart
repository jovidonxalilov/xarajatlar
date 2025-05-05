import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/data/model/auth_model.dart';

class AuthLocalDatasource {
  final String? _myAuthKey = 'my-user-key';
  Future<void> saveAuth(AuthModel authModel)  async{
    final prefs = await SharedPreferences.getInstance();
    final encodeData = jsonEncode(authModel.toJson());
    await prefs.setString(_myAuthKey!, encodeData);
  }

  Future<AuthModel?> getAuth() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_myAuthKey!);

      if (data != null) {
        final decodedData = jsonDecode(data);
        return AuthModel.fromJson(decodedData);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}





























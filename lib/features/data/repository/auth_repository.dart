import 'package:flutter/cupertino.dart';
import '../../../core/source/data_source.dart';
import '../../../core/source/local_datasource.dart';
import '../model/auth_model.dart';

class AuthRepository extends ChangeNotifier{
  final AuthDatasource authDatasource;
  final AuthLocalDatasource authLocalDatasource;

  AuthRepository({required this.authDatasource, required this.authLocalDatasource});

  Future<AuthModel?> getAuth() async {
    return await authLocalDatasource.getAuth();
  }

  Future<AuthModel> register({
    required String email,
    required String password,
  }) async {
    try {
      final authModel =  await authDatasource.register(email: email, password: password);
      await authLocalDatasource.saveAuth(authModel);
      return authModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final authModel =  await authDatasource.login(email: email, password: password);
      await authLocalDatasource.saveAuth(authModel);
      return authModel;
    } catch (e) {
      rethrow;
    }
  }
}




















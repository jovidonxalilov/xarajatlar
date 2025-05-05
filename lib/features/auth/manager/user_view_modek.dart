import 'package:flutter/cupertino.dart';
import '../../data/model/auth_model.dart';
import '../../data/repository/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthViewModel({required this.authRepository});

  bool isLoading = false;

  Future<AuthModel?> getAuth() async {
    return await authRepository.getAuth();
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      final authModel =
          await authRepository.register(email: email, password: password);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      final authModel =
      await authRepository.login(email: email, password: password);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

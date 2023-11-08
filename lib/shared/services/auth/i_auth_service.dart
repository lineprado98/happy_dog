import 'package:happy_dog/shared/services/auth/auth_reponse.dart';

abstract class IAuthService {
  Future<AuthResponse> signin({required String password, required String email});

  Future<AuthResponse> signup({required String password, required String email});

  Future<AuthResponse> signout();

  Future<AuthResponse> forgotPassword({required String email});

  Future<AuthResponse> deleteCurrentAccount();
}

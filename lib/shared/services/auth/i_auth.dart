import 'package:happy_dog/shared/services/auth/auth_reponse.dart';

abstract class IAuth {
  Future<void> signin();
  Future<AuthResponse> signup(
      {required String password, required String email});
  Future<void> sigout();
  Future<void> forgotPassword();
  Future<void> deleteCurrentAccount();
}

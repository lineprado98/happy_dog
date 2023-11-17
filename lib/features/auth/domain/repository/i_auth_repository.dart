import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';
import 'package:happy_dog/shared/services/auth/auth_reponse.dart';

abstract class IAuthRepository {
  Future<(void, MyException?)> createAccount({required UserCredentialEntity credential});
  Future<(void, MyException?)> deleteAccount();
  Future<(void, MyException?)> signinAccount({required UserCredentialEntity credential});
  Future<(void, MyException?)> signoutAccount();
  Future<(AuthResponse?, MyException?)> forgotPasswordAccount({required UserCredentialEntity credential});

  Future<(AuthResponse?, MyException?)> checkLoggedUser();
}

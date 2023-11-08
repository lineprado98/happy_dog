import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';

abstract class IAuthRepository {
  Future<(void, MyException?)> createAccount({required UserCredentialEntity credential});
  Future<(void, MyException?)> deleteAccount();
  Future<(void, MyException?)> signinAccount({required UserCredentialEntity credential});
  Future<(void, MyException?)> signoutAccount();
  Future<(void, MyException?)> forgotPasswordAccount({required UserCredentialEntity credential});
}

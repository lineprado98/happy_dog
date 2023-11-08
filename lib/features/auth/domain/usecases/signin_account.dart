import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/domain/repository/i_auth_repository.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';

class SigninAccount {
  final IAuthRepository repository;
  SigninAccount({required this.repository});

  Future<(void, MyException?)> signin({required UserCredentialEntity value}) async {
    return await repository.signinAccount(credential: value);
  }
}

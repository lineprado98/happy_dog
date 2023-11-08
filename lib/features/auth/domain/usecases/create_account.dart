import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/domain/repository/i_auth_repository.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';

class CreateAccount {
  final IAuthRepository repository;

  CreateAccount({required this.repository});

  Future<(void, MyException?)> create(UserCredentialEntity value) async {
    return await repository.createAccount(credential: value);
  }
}

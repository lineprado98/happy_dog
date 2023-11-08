import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/domain/repository/i_auth_repository.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';

class ResetPasswordAccount {
  final IAuthRepository repository;
  ResetPasswordAccount({required this.repository});

  Future<(void, MyException?)> resetPasswordAccount(UserCredentialEntity value) async {
    return await repository.forgotPasswordAccount(credential: value);
  }
}

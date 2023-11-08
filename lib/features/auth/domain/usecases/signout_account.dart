import 'package:happy_dog/features/auth/domain/repository/i_auth_repository.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';

class SignoutAccount {
  final IAuthRepository repository;
  SignoutAccount({required this.repository});

  Future<(void, MyException?)> signoutAccount() async {
    return await repository.signoutAccount();
  }
}

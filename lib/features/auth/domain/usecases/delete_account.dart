import 'package:happy_dog/features/auth/domain/repository/i_auth_repository.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';

class DeleteAccounnt {
  final IAuthRepository repository;
  DeleteAccounnt({required this.repository});

  Future<(void, MyException?)> deleteAccount() async {
    return repository.deleteAccount();
  }
}

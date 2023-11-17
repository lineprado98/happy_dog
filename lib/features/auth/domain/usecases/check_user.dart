import 'package:happy_dog/features/auth/domain/repository/i_auth_repository.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';
import 'package:happy_dog/shared/services/auth/auth_reponse.dart';

class CheckUser {
  final IAuthRepository repository;

  CheckUser({required this.repository});

  Future<(AuthResponse?, MyException?)> checkUser() async {
    return await repository.checkLoggedUser();
  }
}

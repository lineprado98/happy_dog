import 'package:happy_dog/shared/exceptions/my_exception.dart';

class ErrorHandler {
  static String verifyError({required MyException type}) {
    switch (type.runtimeType) {
      case EmailAlreadyExists:
        return 'E-mail já existe!';
      case TooManyRequests:
        return 'Falha, tentemais tarde!';
      case UserNotFound:
        return 'Login ou senha inválidos!';
      case EmailAlreadyInUse:
        return 'Email already in use!';
      case InvalidPassword:
        return 'Invalid credentials!';
      default:
        return 'Erro desconhecido';
    }
  }
}

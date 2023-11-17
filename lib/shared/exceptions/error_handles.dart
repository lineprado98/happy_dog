import 'package:happy_dog/shared/exceptions/my_exception.dart';
import 'package:happy_dog/shared/services/auth/auth_error_type_enum.dart';

class ErrorHandlerAuthentication {
  static MyException handleError(AuthErrorType type) {
    switch (type) {
      case AuthErrorType.emailAlreadyExists:
        return EmailAlreadyExists();

      case AuthErrorType.userNotFound:
        return UserNotFound();

      case AuthErrorType.tooManyRequests:
        return TooManyRequests();
      case AuthErrorType.invalidPassword:
        return InvalidPassword();

      case AuthErrorType.emailAlreadyInUse:
        return EmailAlreadyInUse();

      default:
        return InternalError();
    }
  }
}

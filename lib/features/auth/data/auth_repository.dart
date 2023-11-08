import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/domain/repository/i_auth_repository.dart';
import 'package:happy_dog/shared/exceptions/error_handles.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';
import 'package:happy_dog/shared/services/auth/auth_reponse.dart';
import 'package:happy_dog/shared/services/auth/i_auth_service.dart';

class AuthRepository implements IAuthRepository {
  final IAuthService service;
  AuthRepository({required this.service});

  @override
  Future<(void, MyException?)> createAccount({required UserCredentialEntity credential}) async {
    final response = await service.signup(email: credential.email, password: credential.password);
    if (response.success == false) {
      final exception = ErrorHandlerAuthentication.handleError(response.errorCode!);
      return (null, exception);
    }

    return (AuthResponse(success: true), null);
  }

  @override
  Future<(void, MyException?)> deleteAccount() async {
    final response = await service.deleteCurrentAccount();
    if (response is MyException) {
      return (null, InternalError());
    }
    return (response, null);
  }

  @override
  Future<(void, MyException?)> forgotPasswordAccount({required UserCredentialEntity credential}) async {
    final response = await service.forgotPassword(email: credential.email);
    if (response.success == false) {
      final exception = ErrorHandlerAuthentication.handleError(response.errorCode!);
      return (null, exception);
    }
    return (response, null);
  }

  @override
  Future<(void, MyException?)> signinAccount({required UserCredentialEntity credential}) async {
    final response = await service.signin(password: credential.password, email: credential.email);
    if (response.success == false) {
      final exception = ErrorHandlerAuthentication.handleError(response.errorCode!);
      return (null, exception);
    }
    return (response, null);
  }

  @override
  Future<(void, MyException?)> signoutAccount() async {
    final response = await service.signout();
    if (response.success == false) {
      final exception = ErrorHandlerAuthentication.handleError(response.errorCode!);
      return (null, exception);
    }
    return (null, null);
  }
}

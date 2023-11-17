import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/domain/usecases/signin_account.dart';
import 'package:happy_dog/shared/erros/error_handler.dart';
import 'package:mobx/mobx.dart';
part 'signin_store.g.dart';

class SigninStore = _SigninStoreBase with _$SigninStore;

abstract class _SigninStoreBase with Store {
  final SigninAccount signinAccount;

  _SigninStoreBase({required this.signinAccount});
  @observable
  String messageError = '';

  @action
  void setMessageError(String value) {
    messageError = value;
  }

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  @observable
  bool isError = false;

  @action
  void setIsError(bool value) {
    isError = value;
  }

  Future<void> signin({required UserCredentialEntity params}) async {
    setIsLoading(true);
    await Future.delayed(const Duration(seconds: 5));
    final (_, error) = await signinAccount.signin(value: params);

    if (error != null) {
      setIsError(true);
      final message = ErrorHandler.verifyError(type: error);
      setMessageError(message);
    } else {
      setIsError(false);
    }
    setIsLoading(false);
  }
}

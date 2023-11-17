import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/domain/usecases/reset_password_account.dart';
import 'package:happy_dog/shared/erros/error_handler.dart';
import 'package:mobx/mobx.dart';
part 'reset_password_store.g.dart';

class ResetPasswordStore = _ResetPasswordStoreBase with _$ResetPasswordStore;

abstract class _ResetPasswordStoreBase with Store {
  final ResetPasswordAccount usecase;
  _ResetPasswordStoreBase({required this.usecase});

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

  @action
  Future<void> resetPassword({required UserCredentialEntity value}) async {
    setIsLoading(true);
    final (response, error) = await usecase.resetPasswordAccount(value);

    if (error != null) {
      setIsError(true);
      final message = ErrorHandler.verifyError(type: error);
      setMessageError(message);
    }
    setIsLoading(false);
  }
}

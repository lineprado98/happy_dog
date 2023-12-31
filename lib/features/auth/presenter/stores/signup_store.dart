import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/domain/usecases/create_account.dart';
import 'package:happy_dog/shared/erros/error_handler.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';
import 'package:mobx/mobx.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  final CreateAccount createAccount;

  _SignupStoreBase({
    required this.createAccount,
  });
  @observable
  String? messageError;

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

  Future<void> create({required UserCredentialEntity user}) async {
    setIsLoading(true);
    final (_, error) = await createAccount.create(user);

    if (error is MyException) {
      setIsError(true);
      final message = ErrorHandler.verifyError(type: error);

      setMessageError(message);
      setIsLoading(false);
    }

    setIsLoading(false);
  }
}

import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/domain/usecases/create_account.dart';
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
  bool isLoading = true;

  @action
  void setIsLoading(bool value) {
    isLoading = value;
  }

  @observable
  bool isError = true;

  @action
  void setIsError(bool value) {
    isError = value;
  }

  Future<void> create({required UserCredentialEntity user}) async {
    final (_, error) = await createAccount.create(user);

    if (error != null) {
      final message = errorMessage(error);
      setMessageError(message);
    }
  }

  String errorMessage(MyException exception) {
    if (exception is EmailAlreadyExists) {
      return 'E-mail já existe!';
    } else if (exception is TooManyRequests) {
      return 'Falha, tentemais tarde!';
    } else if (exception is UserNotFound) {
      return 'Login ou senha inválidos!';
    } else if (exception is EmailAlreadyInUse) {
      return 'Log!';
    } else {
      return 'Erro desconhecido!';
    }
  }
}

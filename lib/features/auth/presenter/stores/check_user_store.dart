import 'package:happy_dog/features/auth/domain/usecases/check_user.dart';
import 'package:happy_dog/shared/erros/error_handler.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';
import 'package:mobx/mobx.dart';
part 'check_user_store.g.dart';

class CheckUserStore = _CheckUserStoreBase with _$CheckUserStore;

abstract class _CheckUserStoreBase with Store {
  final CheckUser usecase;
  _CheckUserStoreBase({required this.usecase});
  @observable
  String messageError = '';

  @action
  void setMessageError(String value) {
    messageError = value;
  }

  @observable
  bool isLogged = false;

  @action
  void setIsLogged(bool value) {
    isLogged = value;
  }

  @observable
  bool isError = false;

  @action
  void setIsError(bool value) {
    isError = value;
  }

  @action
  Future<void> checkUserIsLogged() async {
    final (response, error) = await usecase.checkUser();

    if (error != null) {
      setIsError(true);
      final message = ErrorHandler.verifyError(type: error);
      setMessageError(message);
    }
    if (response?.data != null) {
      setIsLogged(true);
    }
  }
}

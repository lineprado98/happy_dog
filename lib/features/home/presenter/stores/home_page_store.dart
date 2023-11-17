import 'package:happy_dog/features/auth/domain/usecases/delete_account.dart';
import 'package:happy_dog/features/auth/domain/usecases/signout_account.dart';
import 'package:happy_dog/shared/erros/error_handler.dart';
import 'package:happy_dog/shared/exceptions/my_exception.dart';
import 'package:mobx/mobx.dart';
part 'home_page_store.g.dart';

class HomePageStore = _HomePageStoreBase with _$HomePageStore;

abstract class _HomePageStoreBase with Store {
  final DeleteAccounnt removeUsecase;
  final SignoutAccount signoutUseCase;
  _HomePageStoreBase({required this.removeUsecase, required this.signoutUseCase});
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

  Future<void> removeAccount() async {
    setIsLoading(true);

    await Future.delayed(const Duration(seconds: 5));
    final (_, error) = await removeUsecase.deleteAccount();
    if (error != null) {
      setIsError(true);
      final message = ErrorHandler.verifyError(type: error);

      setMessageError(message);
    }
    setIsLoading(false);
  }

  Future<void> signout() async {
    setIsLoading(true);

    await Future.delayed(const Duration(seconds: 5));
    final (_, error) = await signoutUseCase.signoutAccount();
    if (error != null) {
      setIsError(true);
      final message = ErrorHandler.verifyError(type: error);

      setMessageError(message);
    }
    setIsLoading(false);
  }
}

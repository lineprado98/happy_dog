import 'package:get_it/get_it.dart';
import 'package:happy_dog/features/auth/data/auth_repository.dart';
import 'package:happy_dog/features/auth/domain/repository/i_auth_repository.dart';
import 'package:happy_dog/features/auth/domain/usecases/create_account.dart';
import 'package:happy_dog/features/auth/domain/usecases/delete_account.dart';
import 'package:happy_dog/features/auth/domain/usecases/reset_password_account.dart';
import 'package:happy_dog/features/auth/domain/usecases/signin_account.dart';
import 'package:happy_dog/features/auth/domain/usecases/signout_account.dart';
import 'package:happy_dog/features/auth/presenter/stores/signup_store.dart';
import 'package:happy_dog/shared/services/auth/firebase_auth_service.dart';
import 'package:happy_dog/shared/services/auth/i_auth_service.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void setup() {
    // Services
    getIt.registerFactory<IAuthService>(() => FirebaseAuthService());
    getIt.registerFactory<IAuthRepository>(() => AuthRepository(service: getIt.get<IAuthService>()));

    //UseCases
    getIt.registerFactory<CreateAccount>(() => CreateAccount(repository: getIt.get<IAuthRepository>()));
    getIt.registerFactory<DeleteAccounnt>(() => DeleteAccounnt(repository: getIt.get<IAuthRepository>()));
    getIt.registerFactory<SigninAccount>(() => SigninAccount(repository: getIt.get<IAuthRepository>()));
    getIt.registerFactory<SignoutAccount>(() => SignoutAccount(repository: getIt.get<IAuthRepository>()));
    getIt.registerFactory<ResetPasswordAccount>(() => ResetPasswordAccount(repository: getIt.get<IAuthRepository>()));

    //Stores
    getIt.registerSingleton<SignupStore>(SignupStore(
      createAccount: getIt.get<CreateAccount>(),
    ));
  }
}

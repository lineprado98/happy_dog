import 'package:go_router/go_router.dart';
import 'package:happy_dog/features/auth/domain/usecases/delete_account.dart';
import 'package:happy_dog/features/auth/domain/usecases/reset_password_account.dart';
import 'package:happy_dog/features/auth/domain/usecases/signin_account.dart';
import 'package:happy_dog/features/auth/domain/usecases/signout_account.dart';
import 'package:happy_dog/features/auth/presenter/stores/signup_store.dart';
import 'package:happy_dog/features/home/presenter/pages/sign_up_first_step.dart';
import 'package:happy_dog/features/home/presenter/pages/home_page.dart';
import 'package:happy_dog/features/home/presenter/pages/sign_up_view_page.dart';
import 'package:happy_dog/shared/service_locator/service_locator.dart';

class AppRouter {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (constext, state) => MyHomePage(
          storeCreate: getIt.get<SignupStore>(),
          storeSignin: getIt.get<SigninAccount>(),
          storeSignout: getIt.get<SignoutAccount>(),
          storeDelete: getIt.get<DeleteAccounnt>(),
          storeResetPassword: getIt.get<ResetPasswordAccount>(),
        ),

        // routes: const []
      ),
      GoRoute(
        path: '/sign_up_view_page',
        builder: (constext, state) => SignUpViewPage(),

        // routes: const []
      ),
    ],
  );
}

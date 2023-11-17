import 'package:go_router/go_router.dart';
import 'package:happy_dog/features/auth/presenter/pages/initial_page.dart';
import 'package:happy_dog/features/auth/presenter/pages/reset_password_page.dart';
import 'package:happy_dog/features/auth/presenter/pages/sign_in_page.dart';
import 'package:happy_dog/features/auth/presenter/pages/sign_up_view_page.dart';
import 'package:happy_dog/features/auth/presenter/stores/check_user_store.dart';
import 'package:happy_dog/features/auth/presenter/stores/reset_password_store.dart';
import 'package:happy_dog/features/auth/presenter/stores/signin_store.dart';
import 'package:happy_dog/features/auth/presenter/stores/signup_store.dart';
import 'package:happy_dog/features/home/presenter/pages/home_page.dart';
import 'package:happy_dog/features/home/presenter/pages/splash_page.dart';
import 'package:happy_dog/features/home/presenter/stores/home_page_store.dart';
import 'package:happy_dog/shared/service_locator/service_locator.dart';

class AppRouter {
  static final routes = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (constext, state) => SplashPage(
                store: getIt.get<CheckUserStore>(),
              )
          // routes: const []
          ),
      GoRoute(
        path: '/home_page',
        builder: (constext, state) => HomePage(
          store: getIt.get<HomePageStore>(),
        ),
      ),
      GoRoute(
        path: '/sign_up_view_page',
        builder: (constext, state) => SignUpViewPage(
          store: getIt.get<SignupStore>(),
        ),
      ),
      GoRoute(
        path: '/sign_in',
        builder: (constext, state) => SignInPage(
          store: getIt.get<SigninStore>(),
        ),
      ),
      GoRoute(
        path: '/initial_page',
        builder: (constext, state) => InitialPage(),
      ),
      GoRoute(
        path: '/reset_password',
        builder: (constext, state) => ResetPassowrdPage(
          store: getIt.get<ResetPasswordStore>(),
        ),
      ),
    ],
  );
}

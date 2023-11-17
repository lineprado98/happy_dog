import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_dog/features/auth/presenter/stores/check_user_store.dart';

class SplashPage extends StatefulWidget {
  final CheckUserStore store;
  const SplashPage({super.key, required this.store});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
    await Future.delayed(const Duration(seconds: 3));
    await widget.store.checkUserIsLogged();

    if (widget.store.isLogged) {
      context.go('/home_page');
    } else {
      context.go('/initial_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
          body: Center(
        child: SvgPicture.asset(
          'assets/svgs/loading_screen_off.svg',
          //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.screen,),
          width: 70,
          height: 70,
        ),
      ));
    });
  }
}

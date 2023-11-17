import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/svgs/welcome_dog.svg',
              //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.screen,),
              width: 200,
              height: 180,
            ),
            const Text(
              'Welcome to Happy dog',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
            ),
            const SizedBox(
              width: 20,
              height: 120,
            ),
            SizedBox(
              width: 370,
              height: 54,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.primary]),
                  borderRadius: BorderRadius.circular(16),
                  shape: BoxShape.rectangle,
                ),
                child: OutlinedButton(
                  onPressed: () {
                    context.push('/sign_in');
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                    side: const MaterialStatePropertyAll(BorderSide.none),
                    animationDuration: Duration.zero,
                  ),
                  child: Text(
                    'Sign in',
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            SizedBox(
              width: 370,
              height: 54,
              child: OutlinedButton(
                onPressed: () {
                  context.push('/sign_up_view_page');
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  side: const MaterialStatePropertyAll(BorderSide(color: Color.fromARGB(255, 158, 31, 31), width: 1.5, style: BorderStyle.solid)),
                  animationDuration: Duration.zero,
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

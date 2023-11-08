import 'package:flutter/material.dart';

class SignUpFirstStep extends StatefulWidget {
  final PageController controller;

  const SignUpFirstStep({super.key, required this.controller});

  @override
  State<SignUpFirstStep> createState() => _SignUpFirstStepState();
}

class _SignUpFirstStepState extends State<SignUpFirstStep> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Find your pawfect match', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          Text('Join Luppy, the dog dating app that helps you find love for both you and your furry friend.'),
          SizedBox(
            height: 120,
          ),
          const Text(
            'Email',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          TextField(
            cursorColor: Colors.white,
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            controller: email,
            decoration: const InputDecoration(
              hintText: 'Enter your email address',
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  )
                  // ),
                  ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: 400,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.primary]),
              borderRadius: BorderRadius.circular(16),
              shape: BoxShape.rectangle,
            ),
            child: OutlinedButton(
              onPressed: () {
                widget.controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                side: const MaterialStatePropertyAll(BorderSide.none),
                animationDuration: Duration.zero,
              ),
              child: Text(
                'Continue',
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

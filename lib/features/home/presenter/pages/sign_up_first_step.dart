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
          Text('Find your pawfect match', style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(height: 20),
          Text(
            'Join Luppy, the dog dating app that helps you find love for both you and your furry friend.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Email',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          TextField(
            cursorColor: Theme.of(context).colorScheme.onBackground,
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            controller: email,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: 'Enter your email address',
              hintStyle: Theme.of(context).textTheme.bodySmall,
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                    width: 1,
                    color: Theme.of(context).colorScheme.onBackground,
                    style: BorderStyle.solid,
                  )
                  // ),
                  ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.primary]),
              borderRadius: BorderRadius.circular(16),
              shape: BoxShape.rectangle,
            ),
            child: OutlinedButton(
              onPressed: () {
                widget.controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
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

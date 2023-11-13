import 'package:flutter/material.dart';
import 'package:happy_dog/mixins/validations_mixin.dart';
import 'package:happy_dog/shared/components/text_field_custom.dart';

class SignUpSecondStep extends StatefulWidget {
  @override
  State<SignUpSecondStep> createState() => _SignUpSecondStepState();
}

enum SingingCharacter { female, male }

class _SignUpSecondStepState extends State<SignUpSecondStep> with ValidationMixion {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final globalkey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: globalkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 40, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create a password to access.',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Passord',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              TextFieldCustom(
                onChanged: (text) {
                  password.text = text;
                },
                obscureText: true,
                validations: isValidPassword,
                controller: password,
                hint: 'Enter your password',
                label: 'email',
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Confirm Password',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              TextFieldCustom(
                obscureText: true,
                onChanged: (text) => {confirmPassword.text = text},
                validations: (text) {
                  if (text != password.text) {
                    return 'Invalid password';
                  }
                  return null;
                },
                controller: confirmPassword,
                hint: 'Enter with password confirm',
                label: 'email',
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                  width: 400,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.primary]),
                    borderRadius: BorderRadius.circular(16),
                    shape: BoxShape.rectangle,
                  ),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                      side: const MaterialStatePropertyAll(BorderSide.none),
                      animationDuration: Duration.zero,
                    ),
                    child: Text(
                      'Finish',
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

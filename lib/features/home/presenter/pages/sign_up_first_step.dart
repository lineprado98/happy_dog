import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:happy_dog/features/auth/domain/entities/dog_informatial_entity.dart';
import 'package:happy_dog/mixins/validations_mixin.dart';
import 'package:happy_dog/shared/components/text_field_custom.dart';

class SignUpFirstStep extends StatelessWidget with ValidationMixion {
  final PageController controller;
  DogInformatial formDog;

  SignUpFirstStep({super.key, required this.controller, required this.formDog});

  @override
  Widget build(BuildContext context) {
    final globalkey = GlobalKey<FormState>();
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
          Form(
            key: globalkey,
            child: Column(
              children: [
                TextFieldCustom(
                  validations: isEmail,
                  onSave: (text) => formDog = formDog.copyWith(name: text),
                  onChanged: (text) {
                    formDog = formDog.copyWith(name: text);
                  },
                  controller: email,
                  initalValue: formDog.name,
                  hint: 'email',
                  label: 'email',
                ),
                const SizedBox(
                  height: 40,
                ),
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
                      globalkey.currentState?.validate();
                      if (globalkey.currentState!.validate()) {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      }
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
          ),
        ],
      ),
    ));
  }
}

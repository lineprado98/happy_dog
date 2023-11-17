import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/mixins/validations_mixin.dart';
import 'package:happy_dog/shared/components/text_field_custom.dart';

class SignUpFirstStep extends StatefulWidget {
  final PageController controller;
  final ValueNotifier<UserCredentialEntity> form;

  const SignUpFirstStep({
    super.key,
    required this.controller,
    required this.form,
  });

  @override
  State<SignUpFirstStep> createState() => _SignUpFirstStepState();
}

class _SignUpFirstStepState extends State<SignUpFirstStep> with ValidationMixion {
  final globalKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          ValueListenableBuilder(
              valueListenable: widget.form,
              builder: (context, forms, _) {
                return Form(
                  key: globalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Name',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      TextFieldCustom(
                        validations: isNotEmpty,
                        // onSave: (text) => form = form.copyWith(name: text),
                        onChanged: (text) {
                          widget.form.value = widget.form.value.copyWith(name: text);
                        },
                        controller: name,
                        initalValue: widget.form.value.name,
                        hint: 'name',
                        label: 'name',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Email',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      TextFieldCustom(
                        validations: isEmail,
                        //   onSave: (text) => form = form.copyWith(email: text),
                        onChanged: (text) {
                          widget.form.value = widget.form.value.copyWith(email: text);
                        },
                        controller: email,
                        initalValue: widget.form.value.email,
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
                            inspect(widget.form);
                            globalKey.currentState!.validate();
                            if (globalKey.currentState!.validate()) {
                              widget.controller.jumpToPage(1);
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
                );
              }),
        ],
      ),
    ));
  }
}

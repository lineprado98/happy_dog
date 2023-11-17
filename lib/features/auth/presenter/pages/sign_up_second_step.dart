import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/presenter/stores/signup_store.dart';
import 'package:happy_dog/mixins/validations_mixin.dart';
import 'package:happy_dog/shared/components/button_sheet/button_sheet_custom.dart';
import 'package:happy_dog/shared/components/text_field_custom.dart';

class SignUpSecondStep extends StatefulWidget {
  ValueNotifier<UserCredentialEntity> formUser;
  final SignupStore store;

  SignUpSecondStep({super.key, required this.formUser, required this.store});

  @override
  State<SignUpSecondStep> createState() => _SignUpSecondStepState();
}

class _SignUpSecondStepState extends State<SignUpSecondStep> with ValidationMixion {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: widget.store.isLoading == true
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: globalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 40, left: 8),
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
                          widget.formUser.value = widget.formUser.value.copyWith(password: text);
                        },
                        // onSave: (text) => formUser = formUser.copyWith(password: text),
                        obscureText: true,
                        validations: isValidPassword,
                        controller: password,
                        hint: 'Enter your password',
                        label: 'email',
                        initalValue: widget.formUser.value.password,
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
                          if (text != widget.formUser.value.password) {
                            return 'Invalid password';
                          }
                          return null;
                        },
                        controller: confirmPassword,
                        hint: 'Enter with password confirm',
                        label: 'email',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Container(
                          width: 400,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.primary]),
                            borderRadius: BorderRadius.circular(16),
                            shape: BoxShape.rectangle,
                          ),
                          child: OutlinedButton(
                            onPressed: () async {
                              inspect(widget.formUser);
                              await widget.store.create(user: widget.formUser.value);
                              if (widget.store.isError == true) {
                                ButtonSheetCustom.alertError(messageError: widget.store.messageError, context: context);
                              } else {
                                context.push('/home_page');
                              }
                            },
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
    });
  }
}

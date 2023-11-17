import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/presenter/stores/signin_store.dart';
import 'package:happy_dog/mixins/validations_mixin.dart';
import 'package:happy_dog/shared/components/button_sheet/button_sheet_custom.dart';
import 'package:happy_dog/shared/components/text_field_custom.dart';

class SignInPage extends StatelessWidget with ValidationMixion {
  final SigninStore store;
  SignInPage({super.key, required this.store});
  final globalKey = GlobalKey<FormState>();
  UserCredentialEntity userCredential = UserCredentialEntity();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
          appBar: AppBar(),
          body: store.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Back to pawsome matches',
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                color: Theme.of(context).colorScheme.onBackground,
                              )),
                      const SizedBox(height: 10),
                      Text(
                        'Missed us? Log in to resume your furry love quest.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Form(
                        key: globalKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                userCredential = userCredential.copyWith(email: text);
                              },
                              controller: email,
                              initalValue: userCredential.email,
                              hint: 'Enter your email address',
                              label: 'email',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'Password',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            TextFieldCustom(
                              obscureText: true,
                              onChanged: (text) => userCredential = userCredential.copyWith(password: text),
                              initalValue: userCredential.password,
                              validations: isNotEmpty,
                              controller: password,
                              hint: 'Enter with password',
                              label: 'password',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    context.push('/reset_password');
                                  },
                                  child: Text(
                                    'Forgot your password?',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                              ],
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
                                onPressed: () async {
                                  globalKey.currentState!.validate();
                                  if (globalKey.currentState!.validate()) {
                                    await store.signin(params: userCredential);
                                    if (store.isError == true) {
                                      ButtonSheetCustom.alertError(messageError: store.messageError, context: context);
                                    } else {
                                      context.push('/home_page');
                                    }
                                  }
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                                  side: const MaterialStatePropertyAll(BorderSide.none),
                                  animationDuration: Duration.zero,
                                ),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ));
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/presenter/stores/reset_password_store.dart';
import 'package:happy_dog/mixins/validations_mixin.dart';
import 'package:happy_dog/shared/components/button_sheet/button_sheet_custom.dart';
import 'package:happy_dog/shared/components/text_field_custom.dart';

class ResetPassowrdPage extends StatelessWidget with ValidationMixion {
  final ResetPasswordStore store;
  const ResetPassowrdPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    UserCredentialEntity userCredential = UserCredentialEntity();
    final TextEditingController email = TextEditingController();

    final globalKey = GlobalKey<FormState>();

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
                              //   initalValue: userCredential.email,
                              hint: 'Enter your email address',
                              label: 'email',
                            ),
                            const SizedBox(
                              height: 15,
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
                                  store.resetPassword(value: userCredential);
                                  if (store.isError == true) {
                                    ButtonSheetCustom.alertError(messageError: store.messageError, context: context);
                                  } else {
                                    context.go('/initial_page');
                                  }
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                                  side: const MaterialStatePropertyAll(BorderSide.none),
                                  animationDuration: Duration.zero,
                                ),
                                child: Text(
                                  'Send code',
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

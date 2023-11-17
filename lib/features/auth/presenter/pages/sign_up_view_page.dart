import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_dog/features/auth/domain/entities/user_credential_entity.dart';
import 'package:happy_dog/features/auth/presenter/pages/sign_up_first_step.dart';
import 'package:happy_dog/features/auth/presenter/pages/sign_up_second_step.dart';
import 'package:happy_dog/features/auth/presenter/stores/signup_store.dart';

import 'package:happy_dog/features/home/presenter/widgets/dots_widget.dart';

class SignUpViewPage extends StatelessWidget {
  final SignupStore store;
  SignUpViewPage({required this.store});
  final controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  final ValueNotifier<UserCredentialEntity> form = ValueNotifier<UserCredentialEntity>(UserCredentialEntity());

  final ValueNotifier<int> count = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            ValueListenableBuilder<int>(
                valueListenable: count,
                builder: (context, int current, _) {
                  return Center(
                    child: Row(
                      children: List.generate(2, (index) {
                        return DotsWidget(status: current >= index);
                      }),
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      if (controller.page == 0) {
                        context.pop('/');
                      } else {
                        controller.keepPage;
                        controller.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    )),
                const Text(
                  'Back',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  count.value = value;
                },
                controller: controller,
                children: [
                  SignUpFirstStep(
                    controller: controller,
                    form: form,
                  ),
                  SignUpSecondStep(formUser: form, store: store)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

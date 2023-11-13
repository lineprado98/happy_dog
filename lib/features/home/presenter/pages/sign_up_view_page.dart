import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_dog/features/auth/domain/entities/dog_informatial_entity.dart';
import 'package:happy_dog/features/home/presenter/pages/sign_up_first_step.dart';
import 'package:happy_dog/features/home/presenter/pages/sign_up_second_step.dart';
import 'package:happy_dog/features/home/presenter/widgets/dots_widget.dart';

class SignUpViewPage extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  final DogInformatial form = DogInformatial();

  final ValueNotifier<int> count = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            ValueListenableBuilder<int>(
                valueListenable: count,
                builder: (context, int current, _) {
                  return Row(
                    children: List.generate(3, (index) {
                      return DotsWidget(status: current >= index);
                    }),
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
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                        // controller.keepPage.hashCode;
                        // controller.onDetach.hashCode;
                        // controller.positions.first;
                        // controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
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
                    formDog: form,
                  ),
                  SignUpSecondStep()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class SignUpViewPage extends StatefulWidget {
//   @override
//   State<SignUpViewPage> createState() => _SignUpViewPageState();
// }

// class _SignUpViewPageState extends State<SignUpViewPage> {
//   final controller = PageController(initialPage: 0, keepPage: true, viewportFraction: 1.0);
//   final DogInformatial form = DogInformatial();
//   final ValueNotifier<int> count = ValueNotifier<int>(0);
//   final GlobalKey<State<PageView>> pageViewKey = GlobalKey();
//   @override
//   void initState() {
//     super.initState();
//     print('SIGNUP view: ${form.hashCode}');
//     inspect(form);
//   }

 
 
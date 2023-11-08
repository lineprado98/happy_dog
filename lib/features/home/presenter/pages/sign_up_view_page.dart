import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_dog/features/home/presenter/pages/sign_up_first_step.dart';
import 'package:happy_dog/features/home/presenter/pages/sign_up_second_step.dart';
import 'package:happy_dog/features/home/presenter/widgets/dots_widget.dart';

class SignUpViewPage extends StatefulWidget {
  @override
  State<SignUpViewPage> createState() => _SignUpViewPageState();
}

class _SignUpViewPageState extends State<SignUpViewPage> {
  final controller = PageController(initialPage: 0);

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
                        controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
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
                children: [SignUpFirstStep(controller: controller), SignUpSecondStep()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

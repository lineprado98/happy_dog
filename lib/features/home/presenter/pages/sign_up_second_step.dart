import 'package:flutter/material.dart';

class SignUpSecondStep extends StatefulWidget {
  @override
  State<SignUpSecondStep> createState() => _SignUpSecondStepState();
}

class _SignUpSecondStepState extends State<SignUpSecondStep> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Second',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

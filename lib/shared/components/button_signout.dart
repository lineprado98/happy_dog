import 'package:flutter/material.dart';

class ButtonSignout extends StatelessWidget {
  final Future<void> Function() onPressed;
  const ButtonSignout({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.logout_outlined,
          size: 30,
        ));
  }
}

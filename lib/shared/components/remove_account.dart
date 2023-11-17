import 'package:flutter/material.dart';

class RemoveAccount extends StatelessWidget {
  final Future<void> Function() onPressed;

  const RemoveAccount({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: const Text('Remover conta'));
  }
}

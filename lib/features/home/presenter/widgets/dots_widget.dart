import 'package:flutter/material.dart';

class DotsWidget extends StatelessWidget {
  final bool status;
  const DotsWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          // color: status ? Theme.of(context).colorScheme.primary : Colors.white,
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: status
                ? [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary]
                : [
                    Colors.white,
                    Colors.white,
                  ],
          ),
        ),
        height: 6,
        width: 120,
      ),
    );
  }
}

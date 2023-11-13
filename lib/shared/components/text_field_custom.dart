import 'package:flutter/material.dart';
import 'package:happy_dog/mixins/validations_mixin.dart';

class TextFieldCustom extends StatefulWidget {
  final TextEditingController? controller;
  final Icon? icon;
  final String label;
  final bool? obscureText;
  final String? hint;
  final String? Function(String?)? validations;
  final void Function(String? text)? onSave;
  final void Function(String text)? onChanged;

  final String? initalValue;
  const TextFieldCustom({super.key, required this.controller, this.icon, this.hint, this.onSave, required this.label, this.validations, this.onChanged, this.initalValue, this.obscureText});

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validations,
      onChanged: widget.onChanged,
      initialValue: widget.initalValue,
      cursorColor: Theme.of(context).colorScheme.onBackground,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: widget.hint,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.onBackground,
              style: BorderStyle.solid,
            )
            // ),
            ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SignUpSecondStep extends StatefulWidget {
  @override
  State<SignUpSecondStep> createState() => _SignUpSecondStepState();
}

enum SingingCharacter { female, male }

class _SignUpSecondStepState extends State<SignUpSecondStep> {
  final dropValue = ValueNotifier('');
  final List<String> ops = ['op1', 'op2'];
  late SingingCharacter? _character = SingingCharacter.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0, bottom: 40, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tell us about your 🐶’ soulmate',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Help us find the perfect match for your dog by providing some information about them.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'Dog´s Name',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextField(
              cursorColor: Theme.of(context).colorScheme.onBackground,
              onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Enter your dog´s name ',
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                  fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
                ),
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
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Dog´s Age',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            ValueListenableBuilder(
                valueListenable: dropValue,
                builder: (BuildContext context, String value, _) {
                  return SizedBox(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onBackground,
                            )
                            // ),
                            ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                      hint: Text(
                        'Age',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (op) => dropValue.value = op.toString(),
                      items: ops
                          .map((value) => DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ))
                          .toList(),
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'Breed',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextField(
              cursorColor: Theme.of(context).colorScheme.onBackground,
              onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Enter your dog´s breed ',
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                  fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
                ),
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
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: const Text('Male'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.male,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: const Text('Female'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.female,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: const Text('s'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.male,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: const Text('M'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.female,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListTile(
                    title: const Text('L'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.male,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Theme.of(context).colorScheme.secondary, Theme.of(context).colorScheme.primary]),
                  borderRadius: BorderRadius.circular(16),
                  shape: BoxShape.rectangle,
                ),
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                    side: const MaterialStatePropertyAll(BorderSide.none),
                    animationDuration: Duration.zero,
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../strings.dart' show enterYourPasswordHere;

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwodController;
  const PasswordTextField({required this.passwodController, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwodController,
      obscureText: true,
      // obscuringCharacter: '😒',
      decoration: const InputDecoration(
        hintText: enterYourPasswordHere,
      ),
    );
  }
}

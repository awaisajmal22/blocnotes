import 'package:flutter/material.dart';
import 'package:notesblocapp/utils/generic_dailog.dart';

import '../strings.dart';

typedef OnLoginTap = void Function(
  String email,
  String password,
);

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final OnLoginTap onLoginTap;
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final email = emailController.text;
        final password = passwordController.text;
        if (email.isEmpty || password.isEmpty) {
          print('loadihg');
          showGenericDailog<bool>(
              context: context,
              title: emailOrPasswordEmpityDailogTitle,
              content: emailOrPasswordEmpityDescription,
              optionBuiler: () => {ok: true});
        } else {
          print('done');
          onLoginTap(email, password);
        }
      },
      child: const Text(login),
    );
  }
}

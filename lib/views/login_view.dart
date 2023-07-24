import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notesblocapp/views/email_text_field.dart';
import 'package:notesblocapp/views/login_button.dart';

import 'password_text_field.dart';

class LoginView extends HookWidget {
  final OnLoginTap onLoginTap;
  const LoginView({required this.onLoginTap, super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Column(
      children: [
        EmailTextField(emailController: emailController),
        PasswordTextField(passwodController: passwordController,),
        LoginButton(emailController: emailController, passwordController: passwordController, onLoginTap: onLoginTap)
      ],
    );
  }
}

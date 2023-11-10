import 'package:flutter/material.dart';
import 'package:flutter_task/ui/auth/login_screen.dart';
import 'package:flutter_task/ui/auth/socials_login.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';
import 'package:flutter_task/utils/spacer.dart';
import 'package:flutter_task/utils/textform_input.dart';

import 'widgets/login_divider.dart';
import 'widgets/topheader.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopHeader(text: "Join us and get\nstarted!"),
              const Space(35),
              TextFormInput(
                  labelText: "Enter your username",
                  controller: userName,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value),
              const Space(20),
              TextFormInput(
                  labelText: "Enter your email",
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value),
              const Space(30),
              MainButton(onPressed: () {}, text: "Register"),
              const Space(40),
              const LoginDivider(
                text: "Or Register with",
              ),
              const Space(30),
              const SocialsLogin(),
              const Space(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: AppFontWeight.regular,
                        ),
                  ),
                  ClickableText(
                      color: AppColors.primaryColor,
                      text: "Login Now",
                      isBold: true,
                      underline: true,
                      onPressed: () =>
                          context.navigateReplace(const LoginScreen()))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

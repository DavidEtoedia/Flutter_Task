import 'package:flutter/material.dart';
import 'package:flutter_task/ui/auth/register_screen.dart';
import 'package:flutter_task/ui/auth/socials_login.dart';
import 'package:flutter_task/ui/auth/verify_email.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';
import 'package:flutter_task/utils/spacer.dart';
import 'package:flutter_task/utils/textform_input.dart';

import 'widgets/login_divider.dart';
import 'widgets/topheader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              const TopHeader(text: "Welcome back,\nPlease log in"),
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
              Align(
                alignment: Alignment.centerRight,
                child: ClickableText(
                    color: AppColors.primaryColor,
                    text: "Forgot Password ?",
                    underline: true,
                    onPressed: () {}),
              ),
              const Space(30),
              MainButton(
                  onPressed: () => context.navigate(const VerifyEmailScreen()),
                  text: "Login"),
              const Space(40),
              const LoginDivider(),
              const Space(30),
              const SocialsLogin(),
              const Space(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: AppFontWeight.regular,
                        ),
                  ),
                  ClickableText(
                      color: AppColors.primaryColor,
                      text: "Register Now",
                      isBold: true,
                      underline: true,
                      onPressed: () =>
                          context.navigateReplace(const RegisterScreen()))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

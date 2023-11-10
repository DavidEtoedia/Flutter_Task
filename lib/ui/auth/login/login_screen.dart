import 'package:flutter/material.dart';
import 'package:flutter_task/ui/auth/login/vm/login_state.dart';
import 'package:flutter_task/ui/auth/register/register_screen.dart';
import 'package:flutter_task/ui/auth/socials_login.dart';
import 'package:flutter_task/ui/main_navigation.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';
import 'package:flutter_task/utils/spacer.dart';
import 'package:flutter_task/utils/textform_input.dart';
import 'package:flutter_task/utils/validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/login_divider.dart';
import '../widgets/topheader.dart';
import 'vm/login_vm.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

  handleReq() {
    if (email.text.isEmpty || password.text.isEmpty) return;
    ref.read(loginControllerProvider.notifier).login(email.text, password.text);
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    final login = ref.watch(loginControllerProvider);
    ref.listen<LoginState>(loginControllerProvider, ((previous, state) {
      if (state is LoginStateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
        ));
      }
      if (state is LoginStateSuccess) {
        context.navigateReplaceRoot(const MainNavigation());
      }
    }));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: AbsorbPointer(
            absorbing: login is LoginStateLoading ? true : false,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopHeader(text: "Welcome back,\nPlease log in"),
                  const Space(35),
                  TextFormInput(
                      labelText: "Enter your email",
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => validateEmail(value)),
                  const Space(20),
                  TextFormInput(
                      labelText: "Enter your password",
                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) => validatePassword(value)),
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
                      isLoading: login is LoginStateLoading ? true : false,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          handleReq();
                        }
                      },
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
        ),
      ),
    );
  }
}

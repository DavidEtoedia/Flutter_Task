import 'package:flutter/material.dart';
import 'package:flutter_task/ui/auth/login/login_screen.dart';
import 'package:flutter_task/ui/auth/register/vm/register_state.dart';
import 'package:flutter_task/ui/auth/register/vm/register_vm.dart';
import 'package:flutter_task/ui/auth/socials_login.dart';
import 'package:flutter_task/ui/auth/verify_email.dart';
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

class RegisterScreen extends StatefulHookConsumerWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();

  handleReq() {
    if (email.text.isEmpty || password.text.isEmpty || name.text.isEmpty) {
      return;
    }
    ref
        .read(registerControllerProvider.notifier)
        .register(email.text, password.text, name.text);
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    final register = ref.watch(registerControllerProvider);
    ref.listen<RegisterState>(registerControllerProvider, ((previous, state) {
      if (state is RegisterStateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.error),
        ));
      } else if (state is RegisterStateSuccess) {
        context.navigate(const VerifyEmailScreen());
      }
    }));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: AbsorbPointer(
            absorbing: register is RegisterStateLoading ? true : false,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TopHeader(text: "Join us and get\nstarted!"),
                  const Space(35),
                  TextFormInput(
                      labelText: "Enter your name",
                      controller: name,
                      keyboardType: TextInputType.name,
                      validator: (value) => validateName(value)),
                  const Space(20),
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
                  const Space(30),
                  MainButton(
                      isLoading:
                          register is RegisterStateLoading ? true : false,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          handleReq();
                        }
                      },
                      text: "Register"),
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
        ),
      ),
    );
  }
}

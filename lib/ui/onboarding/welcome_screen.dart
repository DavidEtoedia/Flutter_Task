import 'package:flutter/material.dart';
import 'package:flutter_task/ui/auth/login/login_screen.dart';
import 'package:flutter_task/ui/auth/register/register_screen.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';
import 'package:flutter_task/utils/spacer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _isContentVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isContentVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            AppImage.imageBg,
            fit: BoxFit.fill,
          )),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            bottom: _isContentVisible ? 0 : -size.height * 0.5,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              height: size.height * 0.45,
              decoration: BoxDecoration(
                  color: AppColors.welcome.withOpacity(0.8),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                children: [
                  const Space(20),
                  Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: AppFontWeight.bold,
                        ),
                  ),
                  Text(
                    "Contrary to popular belief, Lorem Ipsum is not simply.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: AppFontWeight.regular,
                        ),
                  ),
                  const Spacer(),
                  MainButton(
                    onPressed: () => context.navigate(const RegisterScreen()),
                    text: "Register",
                    textColor: Colors.black,
                    color: Colors.white,
                  ),
                  const Space(15),
                  MainButton(
                    onPressed: () => context.navigate(const LoginScreen()),
                    text: "Login",
                    textColor: Colors.white,
                    withBorder: true,
                    color: Colors.transparent,
                  ),
                  const Space(20),
                  Text(
                    "Continue as a guest",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.transparent,
                          fontSize: 15,
                          fontWeight: AppFontWeight.regular,
                          shadows: [
                            const Shadow(
                                color: Colors.white, offset: Offset(0, -3))
                          ],
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 2,
                        ),
                  ),
                  const Space(30)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_task/ui/auth/widgets/topheader.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/dialog/alert_screen_util.dart';
import 'package:flutter_task/utils/spacer.dart';
import 'package:pinput/pinput.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController code = TextEditingController();
  bool obscure = false;
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 30,
            letterSpacing: 0.0,
          ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: Colors.grey)),
    );
    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(137, 146, 160, 1),
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopHeader(text: ""),
                Center(child: Image.asset(AppImage.verify)),
                const Space(20),
                Center(
                  child: Text(
                    "Verify your email",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: AppFontWeight.bold,
                        ),
                  ),
                ),
                const Space(10),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: Text(
                    "Enter the verification code we just sent on your email address.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: AppFontWeight.regular,
                        ),
                  ),
                ),
                const Space(20),
                Center(
                  child: Pinput(
                    length: 5,
                    controller: code,
                    focusNode: focusNode,
                    defaultPinTheme: defaultPinTheme,
                    separator: const SizedBox(width: 16),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.5, color: Colors.grey),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.05999999865889549),
                            offset: Offset(0, 3),
                            blurRadius: 16,
                          )
                        ],
                      ),
                    ),
                    showCursor: true,
                    cursor: cursor,
                  ),
                ),
                const Space(20),
                MainButton(
                    onPressed: () {
                      ScreenAlertView.showSuccessDialog(context: context);
                    },
                    text: "Verify"),
                const Space(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn’t received code?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: AppFontWeight.regular,
                          ),
                    ),
                    ClickableText(
                        color: AppColors.primaryColor,
                        text: "Resend",
                        isBold: true,
                        underline: true,
                        onPressed: () {})
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

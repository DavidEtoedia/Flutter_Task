import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';
import 'package:flutter_task/utils/spacer.dart';

class ScreenAlertView {
  static showSuccessDialog(
      {required BuildContext context, String errorText = ""}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.white.withOpacity(0.2),
        builder: (_) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: AlertDialog.adaptive(
                  shadowColor: Colors.grey.shade100,
                  backgroundColor: AppColors.dialog,
                  insetPadding: const EdgeInsets.only(left: 50, right: 50),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Space(15),
                      Center(child: Image.asset(AppImage.success)),
                      const Space(20),
                      Text("Verified",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: AppFontWeight.bold,
                                  height: 1.5)),
                      const Space(15),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                            "Yay! you have successfully verified your account",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: AppFontWeight.regular,
                                    height: 1.5)),
                      ),
                      const Space(15),
                      Center(
                        child: ClickableText(
                            color: Colors.white,
                            text: "   Go to Home   ",
                            bgColor: AppColors.primaryColor,
                            textSize: 15,
                            radius: 10,
                            onPressed: () {
                              Navigator.pop(navigator.key.currentContext!);
                            }),
                      )
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32))),
            ));
  }

  static Future<String> showAlertDialog<String>({
    required BuildContext context,
    required Widget content,
    required List<Widget> action,
  }) async {
    final res = await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: content,
        actions: action,
      ),
    );
    return Future.value(res);
  }

  static showInfo(
      {required BuildContext context,
      String message = "",
      String title = "Oops",
      required VoidCallback press}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black26,
        builder: (_) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: AlertDialog.adaptive(
                title: Text(title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        height: 1.5)),
                content: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.5),
                ),
                actions: <Widget>[
                  ClickableText(
                      color: Colors.black,
                      text: "Ok",
                      textSize: 16,
                      onPressed: press)
                ],
              ),
            ));
  }
}

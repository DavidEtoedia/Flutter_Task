import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_task/ui/auth/login/login_screen.dart';
import 'package:flutter_task/ui/main_navigation.dart';
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
                              context
                                  .navigateReplaceRoot(const MainNavigation());
                            }),
                      )
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32))),
            ));
  }

  static showLogoutDialog(
      {required BuildContext context, String errorText = ""}) async {
    final res = await showDialog(
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(AppImage.close)),
                      const Space(15),
                      Center(child: Image.asset(AppImage.logoutImage)),
                      const Space(10),
                      Center(
                        child: Text("Logout",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: AppFontWeight.bold,
                                    height: 1.5)),
                      ),
                      const Space(15),
                      Text(
                          "You can always log back in any time. If you just want to switch accounts, you can add another account.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: AppFontWeight.regular,
                                  height: 1.5)),
                      const Space(25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MainButton(
                              height: 35,
                              fontSize: 12,
                              withBorder: true,
                              color: Colors.transparent,
                              borderColor: Colors.black38,
                              textColor: Colors.black,
                              onPressed: () => Navigator.pop(context, false),
                              text: "Cancel"),
                          const Spacer(),
                          MainButton(
                              height: 35,
                              fontSize: 12,
                              color: Colors.red,
                              onPressed: () {
                                Navigator.pop(context, true);
                                context
                                    .navigateReplaceRoot(const LoginScreen());
                              },
                              text: "logout")
                        ],
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
            ));

    return res;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_task/ui/screens/more/button_model.dart';
import 'package:flutter_task/ui/screens/more/screens/About/about_us_screen.dart';
import 'package:flutter_task/ui/screens/more/screens/donate_screen.dart';
import 'package:flutter_task/ui/screens/more/screens/help&support/help_support_screen.dart';
import 'package:flutter_task/ui/screens/more/screens/notification_screen.dart';
import 'package:flutter_task/ui/screens/more/screens/settings/settings_screen.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/dialog/alert_screen_util.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';
import 'package:flutter_task/utils/spacer.dart';

class MoreButtons extends StatelessWidget {
  const MoreButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            itemCount: moreButton.length,
            itemBuilder: (context, index) {
              final settings = moreButton[index];
              return InkWell(
                splashColor: AppColors.primaryColor.withOpacity(0.1),
                onTap: () {
                  switch (settings.name) {
                    case "Notification":
                      context.navigate(const NotificationScreen());
                      break;

                    case "Bookmarks":
                      break;

                    case "Downloads":
                      break;
                    case "History/Recent Activity":
                      break;

                    case "Settings":
                      context.navigate(const SettingsScreen());

                      break;

                    case "About us":
                      context.navigate(const AboutUsScreen());
                      break;

                    case "Help & support":
                      context.navigate(const HelpAndSupportScreen());
                      break;
                    case "Donate":
                      context.navigate(const DonateScreen());
                      break;

                    case "Log out":
                      ScreenAlertView.showLogoutDialog(context: context);

                      break;

                    default:
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 13, bottom: 13),
                  child: Row(
                    children: [
                      Image.asset(settings.image),
                      const Space(10),
                      Text(settings.name),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 13,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              if (index == 3) {
                return const Divider(
                  color: Colors.black26,
                  height: 10,
                );
              } else if (index == moreButton.length - 2) {
                return const Divider(
                  color: Colors.black26,
                  height: 10,
                );
              } else {
                return const SizedBox.shrink();
              }
            }));
  }
}

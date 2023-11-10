import 'package:flutter/material.dart';
import 'package:flutter_task/ui/screens/more/button_model.dart';
import 'package:flutter_task/ui/screens/more/screens/notification_screen.dart';
import 'package:flutter_task/ui/screens/more/screens/settings/settings_screen.dart';
import 'package:flutter_task/utils/app_color.dart';
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

                      // context.navigate(const StatementOfAcctScreen());
                      break;

                    case "Downloads":

                      // context.navigate(const SecurityScreen());
                      break;
                    case "History/Recent Activity":

                      // context.navigate(const BankAccountScreen());
                      break;

                    case "Settings":
                      context.navigate(const SettingsScreen());

                      break;

                    case "Help":

                      // context.navigate(const HelpScreen());
                      break;

                    case "Refer and Earn":

                      // context.navigate(const ReferAndEarnScreen());
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

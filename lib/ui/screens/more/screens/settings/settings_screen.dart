import 'package:flutter/material.dart';
import 'package:flutter_task/ui/screens/more/screens/profile/edit_profile_screen.dart';
import 'package:flutter_task/utils/app_bar.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';

import 'setting_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool toggle = false;
  int _rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Settings",
        height: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    itemCount: settingsButton.length,
                    itemBuilder: (context, index) {
                      final settings = settingsButton[index];
                      return InkWell(
                        splashColor: AppColors.primaryColor.withOpacity(0.1),
                        onTap: () {
                          switch (settings.name) {
                            case "Account setting":
                              break;

                            case "Edit Profile":
                              context.navigate(const EdifProfileScreen());
                              break;

                            case "Preferred languabe":
                              break;
                            case "Turn on notifications":
                              break;

                            case "Privacy policy":
                              break;

                            case "Rate app":
                              break;

                            case "Delete account":
                              break;

                            default:
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 13, bottom: 13),
                          child: Row(
                            children: [
                              Text(
                                settings.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight:
                                          settings.name.contains("Delete")
                                              ? AppFontWeight.bold
                                              : AppFontWeight.medium,
                                    ),
                              ),
                              const Spacer(),
                              if (settings.name.contains("Turn")) ...[
                                SizedBox(
                                  height: 10,
                                  child: Switch.adaptive(
                                      trackColor: MaterialStateProperty.all(
                                          Colors.grey.shade300),
                                      activeColor: AppColors.primaryColor,
                                      activeTrackColor: AppColors.primaryColor
                                          .withOpacity(0.5),
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.white,
                                      splashRadius: 10.0,
                                      value: toggle,
                                      onChanged: (bool? value) {
                                        setState(() => toggle = value!);
                                      }),
                                )
                              ] else if (settings.name.contains("Rate")) ...[
                                Row(
                                  children: List.generate(
                                      5,
                                      (index) => Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _rating = index + 1;
                                                });
                                              },
                                              child: Image.asset(
                                                AppImage.star,
                                                color: index < _rating
                                                    ? AppColors.primaryColor
                                                    : Colors.grey,
                                                scale: 1.3,
                                              ),
                                            ),
                                          )),
                                )
                              ] else ...[
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 13,
                                ),
                              ]
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
                      } else if (index == settingsButton.length - 2) {
                        return const Divider(
                          color: Colors.black26,
                          height: 10,
                        );
                      } else {
                        return const SizedBox(
                          height: 5,
                        );
                      }
                    }))
          ],
        ),
      ),
    );
  }
}

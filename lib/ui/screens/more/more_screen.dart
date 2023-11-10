import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';
import 'package:flutter_task/utils/spacer.dart';

import 'screens/profile/edit_profile_screen.dart';
import 'widgets/more_buttons.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        border: Border.all(width: 2.0, color: Colors.white)),
                  ),
                  const Space(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fola Aina',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: AppFontWeight.bold,
                            ),
                      ),
                      Text(
                        'jackson@gmail.com',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: AppFontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => context.navigate(const EdifProfileScreen()),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(AppImage.edit),
                        const Space(10),
                        Text(
                          'Edit profile',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: AppFontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Space(20),
            const MoreButtons()
          ],
        ),
      ),
    ));
  }
}

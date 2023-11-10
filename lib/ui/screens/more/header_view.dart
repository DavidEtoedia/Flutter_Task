import 'package:flutter/material.dart';
import 'package:flutter_task/providers/auth_provider.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/extension.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';
import 'package:flutter_task/utils/spacer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screens/profile/edit_profile_screen.dart';

class HeaderCard extends ConsumerWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(authUserProvider);
    return user.maybeWhen(
        data: (data) => Container(
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
                        data!.displayName.valueOrNull(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: AppFontWeight.bold,
                            ),
                      ),
                      Text(
                        data.email.toString(),
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
                    onTap: () => context.navigate(EdifProfileScreen(
                      name: data.displayName ?? "",
                      email: data.email.toString(),
                    )),
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
        orElse: () => const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(),
            ));
  }
}

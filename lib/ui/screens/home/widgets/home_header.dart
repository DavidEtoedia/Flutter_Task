import 'package:flutter/material.dart';
import 'package:flutter_task/providers/auth_provider.dart';
import 'package:flutter_task/ui/screens/more/screens/profile/profile_image.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(authUserProvider);

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, ${user.value?.displayName.valueOrNull()}",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: AppFontWeight.bold,
                  ),
            ),
            Text(
              "What do you want to do today?",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                    fontSize: 15,
                    fontWeight: AppFontWeight.regular,
                  ),
            ),
          ],
        ),
        const Spacer(),
        const ProfileImage(
          height: 50,
          width: 50,
        ),
      ],
    );
  }
}

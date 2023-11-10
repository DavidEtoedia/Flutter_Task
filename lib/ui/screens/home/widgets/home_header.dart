import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Mercy",
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
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
              border: Border.all(width: 3.0, color: AppColors.primaryColor)),
        )
      ],
    );
  }
}

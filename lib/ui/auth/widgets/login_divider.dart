import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/spacer.dart';

class LoginDivider extends StatelessWidget {
  final String text;
  const LoginDivider({super.key, this.text = "Or Login with"});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1.2,
            color: AppColors.inputStroke,
            height: 0.5,
          ),
        ),
        const Space(5),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontSize: 15,
                fontWeight: AppFontWeight.regular,
              ),
        ),
        const Space(5),
        const Expanded(
          child: Divider(
            thickness: 1.2,
            color: AppColors.inputStroke,
            height: 6.0,
          ),
        ),
      ],
    );
  }
}

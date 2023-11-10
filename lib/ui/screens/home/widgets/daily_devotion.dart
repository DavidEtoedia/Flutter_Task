import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/spacer.dart';

class DailDevotion extends StatelessWidget {
  const DailDevotion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Daily Devotional",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontSize: 16,
                fontWeight: AppFontWeight.medium,
              ),
        ),
        const Space(7),
        Text(
          "Today . 26-09-2023",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black45,
                fontSize: 12,
                fontWeight: AppFontWeight.regular,
              ),
        ),
        const Space(5),
        Text(
          "How to live in Victory",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontSize: 14,
                fontWeight: AppFontWeight.medium,
              ),
        ),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: const [
              TextSpan(
                text:
                    'God wants you to live in victory every day of your life. '
                    'Here are three steps to help you walk in victory...',
              ),
              TextSpan(
                text: 'Read More',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: AppFontWeight.regular,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

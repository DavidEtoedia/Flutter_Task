import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/spacer.dart';

class TopHeader extends StatelessWidget {
  final String text;
  const TopHeader({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
        const Space(20),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontSize: 30,
                fontWeight: AppFontWeight.bold,
              ),
        ),
      ],
    );
  }
}

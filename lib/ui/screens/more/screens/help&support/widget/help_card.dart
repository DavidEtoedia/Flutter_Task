import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/spacer.dart';

class HelpCard extends StatelessWidget {
  const HelpCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding:
          EdgeInsets.fromLTRB(15, size.height * 0.11, 15, size.height * 0.11),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AppImage.support))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "How can we\nhelp you today?",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: AppFontWeight.bold,
                ),
          ),
          const Space(15),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Text(
              "Our team is always available to help out. Feel free to reach out with any inquiries, and we’ll respond promptly",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: AppFontWeight.regular,
                  ),
            ),
          ),
          const Space(15),
        ],
      ),
    );
  }
}

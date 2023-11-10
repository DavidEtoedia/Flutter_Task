import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/spacer.dart';

class AboutUsCard extends StatelessWidget {
  const AboutUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AppImage.aboutus))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "About us",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: AppFontWeight.bold,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Text(
              "We Are a nondenominational ministry",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: AppFontWeight.regular,
                  ),
            ),
          ),
          const Space(15),
          Center(
            child: ClickableText(
                color: Colors.white,
                text: "Contact us",
                bgColor: AppColors.primaryColor,
                textSize: 13,
                isBold: true,
                radius: 10,
                onPressed: () {}),
          )
        ],
      ),
    );
  }
}

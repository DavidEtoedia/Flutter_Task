import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/spacer.dart';

class LiveRadio extends StatelessWidget {
  const LiveRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 35, 15),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Live Radio",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontSize: 20,
                fontWeight: AppFontWeight.medium,
              ),
        ),
        const Space(3),
        Text(
          "Listen to Streamglobe Live, the online radio for Christian music and teachings. Chat with hosts and guests. ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
                fontSize: 15,
                fontWeight: AppFontWeight.regular,
              ),
        ),
        const Space(10),
        ClickableText(
            bgColor: AppColors.primaryColor,
            color: Colors.white,
            withIcon: true,
            isBold: true,
            radius: 10,
            text: "Play",
            onPressed: () {})
      ]),
    );
  }
}

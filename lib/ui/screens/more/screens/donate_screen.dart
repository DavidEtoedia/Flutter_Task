import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_bar.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/button/main_button.dart';
import 'package:flutter_task/utils/spacer.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Partner with us",
        height: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImage.partner),
            const Space(30),
            Container(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Text(
                    'Get Involved',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: AppFontWeight.bold,
                        ),
                  ),
                  const Space(10),
                  Text(
                    'Let’s Change the World Together!\nHas God placed it in your heart to support this ministry via voluntary support? See someone’s life changed today.  ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: AppFontWeight.medium,
                        ),
                  ),
                  const Space(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MainButton(
                          height: 40,
                          color: AppColors.secondaryColor,
                          onPressed: () {},
                          text: "Donate"),
                      const Spacer(),
                      MainButton(
                          height: 40,
                          color: Colors.transparent,
                          withBorder: true,
                          onPressed: () {},
                          text: "Give online")
                    ],
                  ),
                ],
              ),
            ),
            const Space(6),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_bar.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/spacer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Notification",
        height: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: AppFontWeight.medium,
                  ),
            ),
            const Space(6),
            Expanded(
                child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 7, bottom: 7),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'You bookmarked Pastor Bankole’s sermon',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: AppFontWeight.regular,
                                      ),
                                ),
                                const Space(6),
                                Text(
                                  '28.10.2022 04:58',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 10,
                                        fontWeight: AppFontWeight.regular,
                                      ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              radius: 5,
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                          color: Colors.black26,
                          height: 10,
                        )))
          ],
        ),
      ),
    );
  }
}

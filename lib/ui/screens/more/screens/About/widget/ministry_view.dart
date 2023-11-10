import 'package:flutter/material.dart';
import 'package:flutter_task/ui/screens/more/screens/About/aboutus_model.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/spacer.dart';

class MinistryView extends StatelessWidget {
  const MinistryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            "Our Ministry",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: AppFontWeight.medium,
                ),
          ),
          const Space(20),
          Expanded(
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  padding: const EdgeInsets.only(bottom: 20),
                  itemCount: aboutUsModel.length,
                  itemBuilder: (context, index) {
                    final aboutUs = aboutUsModel[index];
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            aboutUs.image,
                            scale: 1.4,
                          ),
                          const Space(10),
                          Text(
                            aboutUs.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: AppFontWeight.bold,
                                ),
                          ),
                          const Space(20),
                          Text(
                            aboutUs.content,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: AppFontWeight.regular,
                                ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      )))
        ],
      ),
    );
  }
}

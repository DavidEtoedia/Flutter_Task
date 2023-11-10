import 'package:flutter/material.dart';
import 'package:flutter_task/ui/screens/more/screens/help&support/helpbutton_model.dart';
import 'package:flutter_task/utils/app_bar.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/spacer.dart';

import 'widget/help_card.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Help & Support",
        height: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            const HelpCard(),
            const Space(25),
            Expanded(
              child: Column(
                  children: List.generate(
                      helpButton.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 0.5, color: Colors.black45)),
                              padding:
                                  const EdgeInsets.fromLTRB(17, 11, 17, 11),
                              child: Row(
                                children: [
                                  Image.asset(helpButton[index].image),
                                  const Space(15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        helpButton[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: AppFontWeight.medium,
                                            ),
                                      ),
                                      Text(
                                        helpButton[index].content,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Colors.black38,
                                              fontSize: 13,
                                              fontWeight: AppFontWeight.regular,
                                            ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 13,
                                  ),
                                ],
                              ),
                            ),
                          ))),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_bar.dart';
import 'package:flutter_task/utils/spacer.dart';

import 'widget/aboutus_card.dart';
import 'widget/ministry_view.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "About us",
        height: 80,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [AboutUsCard(), Space(20), MinistryView()],
        ),
      ),
    );
  }
}

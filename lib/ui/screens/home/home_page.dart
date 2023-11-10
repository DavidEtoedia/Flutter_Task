import 'package:flutter/material.dart';
import 'package:flutter_task/ui/screens/home/widgets/daily_devotion.dart';
import 'package:flutter_task/ui/screens/home/widgets/live_radio.dart';
import 'package:flutter_task/utils/spacer.dart';

import 'widgets/audio_sermons.dart';
import 'widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              Space(20),
              DailDevotion(),
              Space(20),
              LiveRadio(),
              Space(20),
              AudioVideoSermon(),
            ],
          ),
        ),
      ),
    );
  }
}

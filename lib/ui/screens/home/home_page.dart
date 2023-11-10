import 'package:flutter/material.dart';
import 'package:flutter_task/model/audio_sermon_model.dart';
import 'package:flutter_task/ui/screens/home/widgets/daily_devotion.dart';
import 'package:flutter_task/ui/screens/home/widgets/live_radio.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/spacer.dart';
import 'package:pinput/pinput.dart';

import 'widgets/audio_sermons.dart';
import 'widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
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

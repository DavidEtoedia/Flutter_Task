import 'package:flutter/material.dart';
import 'package:flutter_task/ui/screens/more/header_view.dart';
import 'package:flutter_task/utils/spacer.dart';

import 'widgets/more_buttons.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [HeaderCard(), Space(20), MoreButtons()],
        ),
      ),
    ));
  }
}

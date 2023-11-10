import 'package:flutter/material.dart';
import 'package:flutter_task/ui/onboarding/onboarding_screen.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter task',
      navigatorKey: navigator.key,
      theme: ThemeData(
        fontFamily: kAppFontFamily,
        primaryColor: Colors.white,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        // useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

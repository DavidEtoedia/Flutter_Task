import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/auth_home.dart';
import 'package:flutter_task/data/shared/shared_pref.dart';
import 'package:flutter_task/firebase_options.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/navigator/navigator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'ui/screens/more/screens/profile/image/image_picker_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  MediaClass.init();
  await SharedPrefManager.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const AuthHome(),
    );
  }
}

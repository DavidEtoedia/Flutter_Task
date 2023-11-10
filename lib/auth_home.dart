import 'package:flutter/material.dart';
import 'package:flutter_task/data/shared/shared_pref.dart';
import 'package:flutter_task/ui/auth/login/login_screen.dart';
import 'package:flutter_task/ui/main_navigation.dart';
import 'package:flutter_task/ui/onboarding/onboarding_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AuthHome extends StatefulHookConsumerWidget {
  const AuthHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthHomeState();
}

class _AuthHomeState extends ConsumerState<AuthHome> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (SharedPrefManager.isFirstLaunch) {
      return const OnboardingScreen();
    } else if (!SharedPrefManager.isLoggedIn) {
      return const LoginScreen();
    } else if (SharedPrefManager.isLoggedIn) {
      return const MainNavigation();
    } else {
      return const OnboardingScreen();
    }
  }
}

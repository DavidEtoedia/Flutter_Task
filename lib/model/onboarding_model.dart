import 'package:flutter_task/utils/app_images.dart';

class Onboarding {
  final String title;
  final String content;
  final String image;

  Onboarding({required this.title, required this.image, required this.content});
}

List<Onboarding> onboarding = [
  Onboarding(
      title: "Welcome to Streamglobe",
      image: AppImage.globe,
      content:
          "Streamglobe helps you stay connected to God and grow in your faith. Whether you like reading, listening or watching, we have the right content for you."),
  Onboarding(
      title: "Explore our features",
      image: AppImage.explore,
      content:
          "Streamglobe helps you stay connected to God and grow in your faith. Whether you like reading, listening or watching, we have the right content for you."),
  Onboarding(
      title: "Join our family",
      image: AppImage.family,
      content:
          "Access Streamglobe’s features and connect with other believers. Join us today and get stronger on your Christian journey.")
];

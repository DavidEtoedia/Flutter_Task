import 'package:flutter_task/utils/app_images.dart';

class HelpButton {
  String name;
  String image;
  String content;

  HelpButton({required this.name, required this.image, required this.content});
}

final List<HelpButton> helpButton = [
  HelpButton(
      name: "Chat Support",
      image: AppImage.chat,
      content: "Start A Conversation"),
  HelpButton(
      name: "FAQs",
      image: AppImage.faq,
      content: "Find Quick Answers To Your Questions"),
  HelpButton(
      name: "Email Support",
      image: AppImage.mail,
      content: "Get Solutions Shared To Your Email"),
];

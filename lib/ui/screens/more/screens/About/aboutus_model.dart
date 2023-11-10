import 'package:flutter_task/utils/app_images.dart';

class AboutUsModel {
  String name;
  String content;
  String image;

  AboutUsModel(
      {required this.name, required this.image, required this.content});
}

final List<AboutUsModel> aboutUsModel = [
  AboutUsModel(
      name: "Nondenominational",
      content:
          "We are a nondenominational ministry with the vision of Streaming the world with the knowledge of God",
      image: AppImage.church),
  AboutUsModel(
      name: "We love the lord",
      content:
          "Overwhelmed by the gift of salvation we have found in Jesus, we are committed to the joy of the Lord by fulfilling God’s purpose",
      image: AppImage.prayer),
  AboutUsModel(
      name: "We Love People",
      content:
          "Our desire is to keep you in God’s presence as you spend time reading or listening to our Devotional",
      image: AppImage.heart),
];

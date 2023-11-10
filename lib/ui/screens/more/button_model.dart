import 'package:flutter_task/utils/app_images.dart';

class MoreButton {
  String name;
  String image;

  MoreButton({
    required this.name,
    required this.image,
  });
}

final List<MoreButton> moreButton = [
  MoreButton(name: "Notification", image: AppImage.notification),
  MoreButton(name: "Bookmarks", image: AppImage.bookmark),
  MoreButton(name: "Downloads", image: AppImage.download),
  MoreButton(name: "History/ Recent Activity", image: AppImage.history),
  MoreButton(name: "Settings", image: AppImage.settings),
  MoreButton(name: "About us", image: AppImage.info),
  MoreButton(name: "Help & support", image: AppImage.help),
  MoreButton(name: "Donte", image: AppImage.donate),
  MoreButton(name: "Log out", image: AppImage.logout),
];

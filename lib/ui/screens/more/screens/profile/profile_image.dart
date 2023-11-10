import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_images.dart';

class ProfileImage extends StatelessWidget {
  final Function()? onTap;
  final bool isProfile;
  final double height;
  final double width;
  const ProfileImage(
      {super.key,
      this.onTap,
      this.isProfile = false,
      this.height = 80,
      this.width = 80});

  @override
  Widget build(BuildContext context) {
    // final image = ref.watch(avatarProvider);
    return Stack(clipBehavior: Clip.none, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.cyan.shade100,
            ),
            child: Image.asset(AppImage.profile)),
      ),
      if (isProfile)
        Positioned(
          bottom: -4,
          right: 0,
          child: FloatingActionButton.small(
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: onTap,
              child: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 15,
                  child: Image.asset(
                    AppImage.camera,
                    scale: 1.5,
                  ))),
        ),
    ]);
  }
}

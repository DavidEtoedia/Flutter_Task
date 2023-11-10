import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/providers/auth_provider.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileImage extends HookConsumerWidget {
  final Function()? onTap;
  final bool isProfile;
  final bool isLoading;
  final double height;
  final double width;
  final String? imageUrl;
  const ProfileImage(
      {super.key,
      this.onTap,
      this.isProfile = false,
      this.isLoading = false,
      this.imageUrl,
      this.height = 110,
      this.width = 110});

  @override
  Widget build(BuildContext context, ref) {
    final image = ref.watch(authUserProvider).value;

    return Stack(clipBehavior: Clip.none, children: [
      if (isLoading)
        SizedBox(
          height: height,
          width: width,
          child: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
      ClipRRect(
        borderRadius: BorderRadius.circular(65),
        child: SizedBox(
            height: height,
            width: width,
            child: (image!.photoURL == null)
                ? Container(
                    height: height,
                    width: width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            scale: 2,
                            image: AssetImage(
                              AppImage.avatar,
                            ))),
                  )
                : CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: image.photoURL.toString(),
                    placeholder: (context, url) => const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => SizedBox(
                        child: Image.asset(
                      AppImage.avatar,
                      scale: 4,
                    )),
                  )),
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

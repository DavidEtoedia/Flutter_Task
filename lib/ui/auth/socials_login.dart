import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_images.dart';

class SocialsLogin extends StatefulWidget {
  const SocialsLogin({super.key});

  @override
  State<SocialsLogin> createState() => _SocialsLoginState();
}

class _SocialsLoginState extends State<SocialsLogin> {
  final List<String> socials = [
    AppImage.facebook,
    AppImage.google,
    AppImage.apple
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          socials.length,
          (index) => Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(40, 12, 40, 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(width: 1, color: AppColors.socialButton)),
                  child: Image.asset(socials[index]),
                ),
              )),
    );
  }
}

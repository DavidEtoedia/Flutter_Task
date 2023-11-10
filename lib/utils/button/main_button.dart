import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/app_images.dart';
import 'package:flutter_task/utils/spacer.dart';

class MainButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color color;
  final bool isLoading;
  final bool withBorder;
  final Color textColor;
  final Color borderColor;
  final double height;

  final double fontSize;

  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.withBorder = false,
    this.isLoading = false,
    this.height = 50,
    this.fontSize = 17,
    this.textColor = Colors.white,
    this.borderColor = Colors.white,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            side: withBorder
                ? BorderSide(width: 1.5, color: borderColor)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading) ...[
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            ] else ...[
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: AppFontWeight.bold),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class ClickableText extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final Color bgColor;
  final double radius;
  final bool underline;
  final bool withIcon;
  final bool isBold;
  final void Function()? onPressed;
  const ClickableText(
      {super.key,
      required this.color,
      required this.text,
      this.withIcon = false,
      this.bgColor = Colors.transparent,
      this.textSize = 15.0,
      this.underline = false,
      this.isBold = false,
      this.radius = 20,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        backgroundColor: bgColor,
        foregroundColor: Colors.transparent,
        disabledForegroundColor: Colors.transparent,
        disabledBackgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: Colors.transparent,
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: textSize,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (withIcon) ...[
            Image.asset(
              AppImage.play,
              color: Colors.white,
            ),
            const Space(10),
          ],
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color,
                  fontSize: textSize,
                  fontWeight:
                      isBold ? AppFontWeight.bold : AppFontWeight.medium,
                  decoration: underline
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationColor: AppColors.primaryColor,
                  decorationThickness: 2,
                ),
          ),
        ],
      ),
    );
  }
}

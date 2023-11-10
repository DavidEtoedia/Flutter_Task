import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';
import 'package:flutter_task/utils/spacer.dart';

class MainButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final String amount;
  final Color color;
  final bool isLoading;
  final bool withBorder;
  final Color textColor;
  const MainButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.withBorder = false,
      this.isLoading = false,
      this.textColor = Colors.white,
      this.color = AppColors.primaryColor,
      this.amount = ""});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            side: withBorder
                ? const BorderSide(width: 1.5, color: Colors.white)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
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
                    fontSize: 17,
                    fontWeight: AppFontWeight.bold),
              ),
              const Space(2),
              Text(
                amount,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
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
  final bool isBold;
  final void Function()? onPressed;
  const ClickableText(
      {super.key,
      required this.color,
      required this.text,
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
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: textSize,
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
              fontSize: textSize,
              fontWeight: isBold ? AppFontWeight.bold : AppFontWeight.medium,
              decoration:
                  underline ? TextDecoration.underline : TextDecoration.none,
              decorationColor: AppColors.primaryColor,
              decorationThickness: 2,
            ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final bool withIcon;
  final void Function()? onPressed;
  const SmallButton(
      {super.key,
      required this.color,
      required this.text,
      this.withIcon = false,
      this.textSize = 13.5,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.green,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: color,
                fontSize: textSize,
                letterSpacing: 0.6,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}

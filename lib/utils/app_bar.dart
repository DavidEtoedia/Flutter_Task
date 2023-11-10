import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app_color.dart';
import 'package:flutter_task/utils/app_font.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final bool loading;
  final Color color;
  final Color textColor;

  const CustomAppBar(
      {super.key,
      this.height = kToolbarHeight,
      this.title = "",
      this.textColor = Colors.black,
      this.color = Colors.transparent,
      this.loading = false});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loading
              ? const LinearProgressIndicator(
                  minHeight: 2,
                  backgroundColor: Colors.white,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.primaryColor))
              : const SizedBox(height: 2),
          AppBar(
            title: Text(title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: AppFontWeight.bold)),
            leading: IconButton(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 18,
                )),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )
        ],
      ),
    );
  }
}

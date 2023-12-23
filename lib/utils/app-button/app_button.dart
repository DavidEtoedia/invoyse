import 'package:flutter/material.dart';
import 'package:invoyse_task/utils/app-color/app_color.dart';
import 'package:invoyse_task/utils/app_font/app_font_style.dart';
import 'package:invoyse_task/utils/extensions.dart';

class MainButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final double height;
  final Color color;
  final bool isLoading;
  final bool isleft;
  final bool withBorder;
  final Color textColor;
  final Widget icon;
  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.withBorder = false,
    this.isLoading = false,
    this.isleft = false,
    this.height = 40,
    this.icon = const SizedBox.shrink(),
    this.textColor = Colors.white,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 50, right: 50),
          backgroundColor: withBorder ? Colors.transparent : color,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side: withBorder
                ? const BorderSide(width: 0.5, color: AppColors.primaryColor)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: context.textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontSize: 16,
              fontWeight: AppFontWeight.regular),
        ),
      ),
    );
  }
}

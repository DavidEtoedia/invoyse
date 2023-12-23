import 'package:flutter/material.dart';
import 'package:invoyse_task/utils/app-color/app_color.dart';
import 'package:invoyse_task/utils/app_font/app_font_style.dart';
import 'package:invoyse_task/utils/app_spacer.dart';
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
          padding: EdgeInsets.only(left: 30, right: 30),
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

class ClickableText extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final bool withIcon;
  final double height;
  final bool isBold;
  final Color bgColor;
  final void Function()? onPressed;
  const ClickableText(
      {super.key,
      this.color = AppColors.primaryColor,
      required this.text,
      this.withIcon = false,
      this.height = 20,
      this.isBold = false,
      this.bgColor = Colors.transparent,
      this.textSize = 15.0,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            backgroundColor: MaterialStateProperty.all<Color>(bgColor),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                const EdgeInsets.only(left: 10, right: 10)),
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: textSize,
            )) // Remove splash effect
            ),
        // style: TextButton.styleFrom(
        //   foregroundColor: Colors.transparent,
        //   shadowColor: Colors.transparent,
        //   surfaceTintColor: Colors.transparent,
        //   disabledForegroundColor: Colors.transparent,
        //   disabledBackgroundColor: Colors.transparent,
        //   padding: EdgeInsets.zero,
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        //   backgroundColor: bgColor,
        //   elevation: 0,
        //   textStyle: TextStyle(
        //     fontWeight: FontWeight.w600,
        //     fontSize: textSize,
        //   ),
        // ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (withIcon) ...[
              const Icon(
                Icons.tune,
                color: AppColors.primaryColor,
              ),
              Space(10),
            ],
            Text(
              text,
              style: isBold
                  ? Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: color,
                        fontSize: textSize,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w700,
                      )
                  : Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: color,
                        fontSize: textSize,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

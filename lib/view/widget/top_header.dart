import 'package:flutter/material.dart';
import 'package:invoyse_task/utils/app-color/app_color.dart';
import 'package:invoyse_task/utils/app_font/app_font_style.dart';
import 'package:invoyse_task/utils/app_spacer.dart';
import 'package:invoyse_task/utils/extensions.dart';

class TopheaderView extends StatelessWidget {
  const TopheaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColors.primaryColor,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Text(
            "JS",
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.primaryColor,
                fontSize: 20,
                fontWeight: AppFontWeight.semibold),
          ),
        ),
        const Space(20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "James & Sons",
              style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: AppFontWeight.semibold),
            ),
            const Space(5),
            Text(
              "Switch business",
              style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                  fontWeight: AppFontWeight.light),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.expand_more,
          color: Colors.white,
        ),
      ]),
    );
  }
}

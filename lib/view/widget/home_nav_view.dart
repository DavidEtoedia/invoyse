import 'package:flutter/material.dart';
import 'package:invoyse_task/model/home_item_model.dart';
import 'package:invoyse_task/utils/app-color/app_color.dart';
import 'package:invoyse_task/utils/app_font/app_font_style.dart';
import 'package:invoyse_task/utils/extensions.dart';

class HomeNavigationView extends StatelessWidget {
  const HomeNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.only(bottom: 30),
      itemCount: homeItem.length,
      itemBuilder: (context, index) {
        if (homeItem[index].name == "Export") {
          return Padding(
            padding:
                const EdgeInsets.only(left: 18, top: 20, bottom: 20, right: 20),
            child: Row(
              children: [
                Text(homeItem[index].name,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textColor,
                        fontSize: 16.5,
                        fontWeight: AppFontWeight.semibold)),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryColor,
                  size: 15,
                )
              ],
            ),
          );
        } else if (homeItem[index].name == "Upgrade  your plan") {
          return Padding(
            padding: const EdgeInsets.only(left: 18, top: 20, bottom: 20),
            child: Text(homeItem[index].name,
                style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textColor,
                    fontSize: 16.5,
                    fontWeight: AppFontWeight.semibold)),
          );
        } else if (homeItem[index].name == "Account settings") {
          return Container(
            color: AppColors.secondaryColor.withOpacity(0.1),
            padding: const EdgeInsets.only(left: 18, top: 20, bottom: 20),
            child: Text(
              homeItem[index].name,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryColor.withOpacity(0.6),
                  fontSize: 19.5,
                  fontWeight: AppFontWeight.bold),
            ),
          );
        } else if (homeItem[index].name == "Logout") {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(homeItem[index].name,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textColor,
                        fontSize: 16.5,
                        fontWeight: AppFontWeight.semibold)),
                leading: const Icon(Icons.exit_to_app),
              ),
              const Divider(height: 1, color: AppColors.dividerColor),
            ],
          );
        } else {
          return ListTile(
            title: Text(
              homeItem[index].name,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textColor,
                  fontSize: 16.5,
                  fontWeight: AppFontWeight.semibold),
            ),
            subtitle: Text(
              homeItem[index].title,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.secondaryColor,
                  fontSize: 12,
                  fontWeight: AppFontWeight.regular),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.primaryColor,
              size: 15,
            ),
          );
        }
      },
      separatorBuilder: (BuildContext context, int index) {
        if (homeItem[index].name == "Account settings" ||
            homeItem[index].name == "Upgrade your plan") {
          return const SizedBox.shrink();
        } else {
          return const Divider(height: 1, color: AppColors.dividerColor);
        }
      },
    ));
  }
}

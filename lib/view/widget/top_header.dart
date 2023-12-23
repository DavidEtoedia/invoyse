import 'package:flutter/material.dart';
import 'package:invoyse_task/controller/business_model_controller.dart';
import 'package:invoyse_task/utils/app-color/app_color.dart';
import 'package:invoyse_task/utils/app_bottomsheet.dart';
import 'package:invoyse_task/utils/app_font/app_font_style.dart';
import 'package:invoyse_task/utils/app_spacer.dart';
import 'package:invoyse_task/utils/extensions.dart';
import 'package:provider/provider.dart';

import 'business_bottom_sheet.dart';

class TopheaderView extends StatelessWidget {
  const TopheaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessController>(builder: (context, business, child) {
      return Container(
        padding: const EdgeInsets.all(15),
        color: AppColors.primaryColor,
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Text(
              business.selectedBusiness.isEmpty
                  ? "--"
                  : business.selectedBusiness.initials,
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
                business.selectedBusiness.isEmpty
                    ? "No Business Added"
                    : business.selectedBusiness,
                style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: AppFontWeight.semibold),
              ),
              const Space(5),
              GestureDetector(
                onTap: () {
                  AppBottomSheet.showcustomsheet(context,
                      widget: BusinessBottomSheet(
                        businessess: business.businessess,
                      ));
                },
                child: Text(
                  "Switch business",
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                      fontWeight: AppFontWeight.light),
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              AppBottomSheet.showcustomsheet(context,
                  widget: BusinessBottomSheet(
                    businessess: business.businessess,
                  ));
            },
            icon: const Icon(
              Icons.expand_more,
              color: Colors.white,
            ),
          )
        ]),
      );
    });
  }
}

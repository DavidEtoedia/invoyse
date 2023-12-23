import 'package:flutter/material.dart';
import 'package:invoyse_task/controller/business_model_controller.dart';
import 'package:invoyse_task/model/business_model.dart';
import 'package:invoyse_task/utils/app-color/app_color.dart';
import 'package:invoyse_task/utils/app_bottomsheet.dart';
import 'package:invoyse_task/utils/app_font/app_font_style.dart';
import 'package:invoyse_task/utils/app_spacer.dart';
import 'package:invoyse_task/utils/extensions.dart';
import 'package:invoyse_task/utils/navigator.dart';
import 'package:invoyse_task/view/business_form.dart';
import 'package:provider/provider.dart';

class TopheaderView extends StatelessWidget {
  const TopheaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BusinessController>(builder: (context, business, child) {
      return Container(
        padding: const EdgeInsets.all(18),
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

class BusinessBottomSheet extends StatelessWidget {
  final List<BusinessModel> businessess;
  const BusinessBottomSheet({super.key, required this.businessess});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              "Switch business",
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: AppFontWeight.semibold),
            ),
            const Spacer(),
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close))
          ],
        ),
        if (businessess.isEmpty) ...[
          Center(
            child: Text(
              "No Business Profile has been created.\nAdd an account ",
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: AppFontWeight.regular),
            ),
          ),
        ],
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            context.navigate(const BusinessForm());
          },
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              const Space(20),
              Text(
                "Add Account ",
                style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: AppFontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}

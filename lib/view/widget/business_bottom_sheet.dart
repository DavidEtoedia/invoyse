import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invoyse_task/controller/business_model_controller.dart';
import 'package:invoyse_task/model/business_model.dart';
import 'package:invoyse_task/utils/app-color/app_color.dart';
import 'package:invoyse_task/utils/app_font/app_font_style.dart';
import 'package:invoyse_task/utils/app_image.dart';
import 'package:invoyse_task/utils/app_spacer.dart';
import 'package:invoyse_task/utils/extensions.dart';
import 'package:invoyse_task/utils/navigator.dart';
import 'package:invoyse_task/view/business_form.dart';
import 'package:provider/provider.dart';

class BusinessBottomSheet extends StatelessWidget {
  final List<BusinessModel> businessess;
  const BusinessBottomSheet({super.key, required this.businessess});

  @override
  Widget build(BuildContext context) {
    final business = context.watch<BusinessController>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Space(20),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(
              child: Text(
                "Switch business",
                style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 18.5,
                    fontWeight: AppFontWeight.semibold),
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  ),
                )),
          ],
        ),
        const Space(10),
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
        ] else ...[
          Expanded(
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  itemCount: businessess.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context
                            .read<BusinessController>()
                            .selecteBusiness(businessess[index].businessName!);
                        context.popView();
                      },
                      child: ListTile(
                        title: Text(
                          businessess[index].businessName.toString(),
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 19,
                              fontWeight: AppFontWeight.bold),
                        ),
                        subtitle: Text(
                          businessess[index].businessAddress.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 13,
                              fontWeight: AppFontWeight.regular),
                        ),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              FileImage(File(businessess[index].logo!)),
                        ),
                        trailing: (business.selectedBusiness ==
                                businessess[index].businessName)
                            ? SvgPicture.asset(AppImage.checked)
                            : const SizedBox.shrink(),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                        height: 2,
                        color: AppColors.secondaryColor.withOpacity(0.2));
                  }))
        ],
        if (businessess.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(
                height: 2, color: AppColors.secondaryColor.withOpacity(0.2)),
          ),
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 10, top: 10, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              context.navigate(const BusinessForm());
            },
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
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
          ),
        )
      ],
    );
  }
}

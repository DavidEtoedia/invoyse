import 'package:flutter/material.dart';
import 'package:invoyse_task/controller/business_model_controller.dart';
import 'package:invoyse_task/model/business_model.dart';
import 'package:invoyse_task/utils/app-color/app_color.dart';
import 'package:invoyse_task/utils/app_spacer.dart';
import 'package:invoyse_task/utils/navigator.dart';
import 'package:invoyse_task/view/screens/business_branding.dart';

import 'screens/business_information.dart';

class BusinessForm extends StatefulWidget {
  const BusinessForm({super.key});

  @override
  State<BusinessForm> createState() => _BusinessFormState();
}

class _BusinessFormState extends State<BusinessForm> {
  final PageController controller =
      PageController(viewportFraction: 1.0, keepPage: true);
  final businessModel = BusinessModel();
  int pageCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // if (pageCount > 0)
                IconButton(
                    onPressed: () {
                      context.popView();
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: pageCount == 0
                          ? AppColors.primaryColor
                          : AppColors.textColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  height: 3,
                  width: 50,
                ),
                const Space(10),
                Container(
                  decoration: BoxDecoration(
                    color: pageCount == 1
                        ? AppColors.primaryColor
                        : AppColors.textColor.withOpacity(0.2),
                  ),
                  height: 3,
                  width: 50,
                ),

                const Spacer(),
              ],
            ),
            Expanded(
              child: PageView(
                controller: controller,
                //physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  setState(() => pageCount = value);
                },
                children: [
                  BusinessInformation(
                    pressed: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                  ),
                  BusinessBranding(
                    pressed: () {
                      controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

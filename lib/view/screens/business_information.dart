import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoyse_task/controller/business_model_controller.dart';
import 'package:invoyse_task/model/business_model.dart';
import 'package:invoyse_task/utils/app-button/app_button.dart';
import 'package:invoyse_task/utils/app_font/app_font_style.dart';
import 'package:invoyse_task/utils/app_image.dart';
import 'package:invoyse_task/utils/app_spacer.dart';
import 'package:invoyse_task/utils/extensions.dart';
import 'package:invoyse_task/utils/textform_input.dart';
import 'package:invoyse_task/utils/validator.dart';
import 'package:provider/provider.dart';

class BusinessInformation extends StatefulWidget {
  final VoidCallback pressed;
  const BusinessInformation({super.key, required this.pressed});

  @override
  State<BusinessInformation> createState() => _BusinessInformationState();
}

class _BusinessInformationState extends State<BusinessInformation> {
  final TextEditingController businessName = TextEditingController();
  final TextEditingController businessEmail = TextEditingController();
  final TextEditingController businessAddress = TextEditingController();
  final TextEditingController businessPhone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  handleReq() {
    var model = BusinessModel(
        businessAddress: businessAddress.text,
        businessEmail: businessEmail.text,
        businessName: businessName.text,
        businessPhone: businessPhone.text);

    context.read<BusinessController>().addBusinessInfo(model);
  }

  @override
  void dispose() {
    businessName.dispose();
    businessEmail.dispose();
    businessAddress.dispose();
    businessPhone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Space(30),
                SvgPicture.asset(AppImage.receipt),
                const Space(30),
                Text(
                  "Business Information.",
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 18.5,
                      fontWeight: AppFontWeight.semibold),
                ),
                const Space(10),
                Text(
                  "Create your business profile.",
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: AppFontWeight.light),
                ),
                const Space(5),
                Text(
                  "(All fields are optional.)",
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: AppFontWeight.light),
                ),
                const Space(30),
                TextFormInput(
                    labelText: "Business name",
                    controller: businessName,
                    keyboardType: TextInputType.name,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[ ]')),
                    ],
                    validator: (value) => validateBusinessName(value)),
                const Space(20),
                TextFormInput(
                    labelText: "Business email address",
                    controller: businessEmail,
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[ ]')),
                    ],
                    validator: (value) => validateEmail(value)),
                const Space(20),
                TextFormInput(
                    labelText: "Business Phone number",
                    controller: businessPhone,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.deny(RegExp('[ ]')),
                    ],
                    validator: (value) => validatePhoneNumber(value)),
                const Space(20),
                TextFormInput(
                    labelText: "Business address ",
                    controller: businessAddress,
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) => validateBusinessName(value)),
                const Space(50),
                ListenableBuilder(
                    listenable: Listenable.merge([
                      businessAddress,
                      businessEmail,
                      businessName,
                      businessPhone
                    ]),
                    builder: (context, child) {
                      return MainButton(
                          onPressed: (businessAddress.text.isEmpty ||
                                  businessEmail.text.isEmpty ||
                                  businessName.text.isEmpty ||
                                  businessPhone.text.isEmpty)
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    if (mounted) {
                                      handleReq();
                                    }
                                  }
                                },
                          text: "Next");
                    })
              ],
            ),
          )),
        ],
      ),
    );
  }
}

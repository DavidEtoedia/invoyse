import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoyse_task/utils/app-button/app_button.dart';
import 'package:invoyse_task/utils/app_font/app_font_style.dart';
import 'package:invoyse_task/utils/app_image.dart';
import 'package:invoyse_task/utils/app_spacer.dart';
import 'package:invoyse_task/utils/currency_formatter.dart';
import 'package:invoyse_task/utils/extensions.dart';
import 'package:invoyse_task/utils/textform_input.dart';
import 'package:invoyse_task/utils/validator.dart';

class BusinessBranding extends StatefulWidget {
  final VoidCallback pressed;
  const BusinessBranding({super.key, required this.pressed});

  @override
  State<BusinessBranding> createState() => _BusinessBrandingState();
}

class _BusinessBrandingState extends State<BusinessBranding> {
  final TextEditingController businessCategory = TextEditingController();
  final TextEditingController upload = TextEditingController();
  final TextEditingController amount = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  GlobalKey<State> _key = GlobalKey();

  final List<String> categories = [
    'Technology',
    'Healthcare',
    'Real Estate',
    'Finance',
    'Construction',
    'Automotive'
  ];

  @override
  void dispose() {
    upload.dispose();
    businessCategory.dispose();
    amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                SvgPicture.asset(AppImage.editCircle),
                const Space(30),
                Text(
                  "Business Branding.",
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontSize: 18.5,
                      fontWeight: AppFontWeight.semibold),
                ),
                const Space(10),
                Text(
                  "Manage your business’s\nbranding",
                  textAlign: TextAlign.center,
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
                    labelText: "Upload Your Logo",
                    controller: upload,
                    keyboardType: TextInputType.name,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 13, right: 20),
                      child: SvgPicture.asset(
                        AppImage.upload,
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp('[ ]')),
                    ],
                    validator: (value) => validateBusinessName(value)),
                const Space(20),
                Stack(
                  children: [
                    TextFormInput(
                        key: _key,
                        labelText: "Business Category",
                        readOnly: true,
                        controller: businessCategory,
                        keyboardType: TextInputType.name,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 13, right: 20),
                          child: SvgPicture.asset(
                            AppImage.category,
                          ),
                        ),
                        onTap: () async {
                          final res = await showPopupMenu(context);
                          if (res == null) return;
                          setState(() {
                            businessCategory.text = res;
                          });
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp('[ ]')),
                        ],
                        validator: (value) => validateEmail(value)),
                  ],
                ),
                const Space(20),
                TextFormInput(
                    labelText: " NGN - Nigerian Naira (₦)",
                    controller: amount,
                    keyboardType: TextInputType.number,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(left: 13, right: 20),
                      child: SvgPicture.asset(
                        AppImage.money,
                      ),
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyTextInputFormatter(symbol: '', decimalDigits: 0)
                    ],
                    validator: (value) => validatePhoneNumber(value)),
                const Space(50),
                ListenableBuilder(
                    listenable:
                        Listenable.merge([amount, upload, businessCategory]),
                    builder: (context, child) {
                      return MainButton(
                          onPressed: (amount.text.isEmpty ||
                                  upload.text.isEmpty ||
                                  businessCategory.text.isEmpty)
                              ? null
                              : () {},
                          text: "Create Your Invoice");
                    })
              ],
            ),
          )),
        ],
      ),
    );
  }

  Future<String?> showPopupMenu(BuildContext context) async {
    final RenderBox renderBox =
        _key.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    return await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          offset.dx,
          offset.dy + renderBox.size.height,
          offset.dx + renderBox.size.width,
          offset.dy + 2 * renderBox.size.height),
      items: categories.map((String category) {
        return PopupMenuItem(
          value: category,
          child: Text(category),
        );
      }).toList(),
    );
  }
}

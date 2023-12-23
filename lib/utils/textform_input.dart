// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:raize/presentation/util/utils_widget.dart';

// class TextFormInput extends StatelessWidget {
//   const TextFormInput(
//       {Key? key,
//       required this.controller,
//       this.autovalidateMode,
//       this.validator,
//       this.labelText,
//       this.obscureText = false,
//       this.isTag = false,
//       this.suffixIcon,
//       this.prefixIcon,
//       this.onChanged,
//       this.onTap,
//       this.inputFormatters,
//       this.enabled,
//       this.textLength,
//       this.isBorderRadius = false,
//       this.isColor = Colors.black,
//       this.fillColor = Colors.white,
//       this.horizontal = 20,
//       this.filled = false,
//       this.showBorder = true,
//       this.borderColor = Colors.black,
//       this.readOnly = false,
//       this.borderRadius = 6,
//       this.onFieldSubmitted,
//       this.onTapOutside,
//       this.onEditingComplete,
//       this.focusNode,
//       this.keyboardType})
//       : super(key: key);

//   final String? labelText;
//   final bool obscureText;
//   final Widget? suffixIcon;
//   final bool? enabled;
//   final bool readOnly;
//   final bool filled;
//   final bool showBorder;
//   final double borderRadius;
//   final Widget? prefixIcon;
//   final bool isBorderRadius;
//   final Color isColor;
//   final Color fillColor;
//   final Color borderColor;
//   final bool isTag;
//   final TextInputType? keyboardType;
//   final TextEditingController controller;
//   final AutovalidateMode? autovalidateMode;
//   final String? Function(String?)? validator;
//   final List<TextInputFormatter>? inputFormatters;
//   final void Function(PointerDownEvent)? onTapOutside;
//   final void Function()? onEditingComplete;
//   final int? textLength;
//   final void Function(String)? onChanged;
//   final Function(String)? onFieldSubmitted;
//   final void Function()? onTap;
//   final FocusNode? focusNode;
//   final double horizontal;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       enabled: enabled,
//       controller: controller,
//       cursorColor: isColor,
//       readOnly: readOnly,
//       focusNode: focusNode,
//       // maxLength: textLength,
//       // maxLengthEnforcement: MaxLengthEnforcement.enforced,
//       autovalidateMode: autovalidateMode,
//       textCapitalization: TextCapitalization.words,
//       inputFormatters: inputFormatters,

//       obscureText: obscureText,
//       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//           fontFamily: kAppSecondaryFontFamily,
//           color: Colors.black,
//           fontSize: 15.sp,
//           fontWeight: FontWeight.w400),
//       textInputAction: TextInputAction.done,
//       keyboardType: keyboardType,
//       onChanged: onChanged,
//       onTapOutside: onTapOutside,
//       onEditingComplete: onEditingComplete,
//       //onEditingComplete: () => FocusScope.of(context).nextFocus(),
//       decoration: InputDecoration(
//           fillColor: fillColor,
//           filled: filled,
//           errorStyle: context.textTheme.labelSmall?.copyWith(
//               fontFamily: kAppSecondaryFontFamily,
//               height: 0.2,
//               color: Colors.red,
//               fontSize: 0.sp),
//           suffixIcon: suffixIcon,
//           prefixIcon: prefixIcon,
//           prefixIconConstraints: const BoxConstraints(
//             minWidth: 25,
//             minHeight: 21,
//           ),
//           iconColor: Colors.grey,
//           errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadius),
//               borderSide: const BorderSide(width: 0.5, color: Colors.red)),
//           focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadius),
//               borderSide: const BorderSide(
//                 width: 0.5,
//                 color: AppColors.primaryColor,
//               )
//               //<-- SEE HERE
//               ),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadius),
//               borderSide: BorderSide(
//                 color: borderColor,
//                 width: 0.5,
//               )),
//           disabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadius),
//               borderSide: BorderSide(
//                   width: 0.5,
//                   color: isTag ? Colors.black.withOpacity(0.5) : borderColor)),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadius),
//               borderSide: BorderSide(
//                 color: isTag
//                     ? Colors.black.withOpacity(0.5)
//                     : AppColors.primaryColor,
//                 width: 0.5,
//               )),
//           contentPadding:
//               EdgeInsets.symmetric(vertical: 10, horizontal: horizontal),
//           floatingLabelBehavior: FloatingLabelBehavior.never,
//           hintText: labelText,
//           hintStyle: context.textTheme.labelMedium?.copyWith(
//             fontFamily: kAppSecondaryFontFamily,
//             color: isTag ? Colors.black : Colors.black38,
//             fontSize: 14.sp,
//             fontWeight: AppFontWeight.regular,
//           ),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(borderRadius),
//               borderSide: BorderSide(
//                 color: borderColor,
//                 width: 0.5,
//               ))),
//       validator: validator,
//       onFieldSubmitted: onFieldSubmitted,
//       onTap: onTap,
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:raize/presentation/util/utils_widget.dart';

// class AppBackButton extends StatelessWidget {
//   final String title;
//   final bool isShadow;
//   final Color textColor;
//   final Color? iconColor;
//   final Function()? onPressed;
//   final Widget widget;
//   const AppBackButton(
//       {super.key,
//       this.title = "",
//       this.isShadow = true,
//       this.onPressed,
//       this.widget = const SizedBox.shrink(),
//       this.textColor = Colors.black,
//       this.iconColor});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         TextButton.icon(
//             style: ButtonStyle(
//               overlayColor: MaterialStateProperty.all<Color>(
//                   Colors.transparent), // Remove splash effect
//             ),
//             onPressed: () => context.pop(),
//             icon: Icon(
//               Icons.arrow_back,
//               color: iconColor ?? Colors.black,
//             ),
//             label: Text(title,
//                 style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                       color: Colors.black,
//                       letterSpacing: -0.3,
//                       fontSize: 15,
//                     ))),
//         Text(title,
//             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                   color: Colors.black,
//                   letterSpacing: -0.3,
//                   fontSize: 15,
//                 )),
//         if (widget != const SizedBox.shrink()) ...[const Spacer(), widget]
//       ],
//     );
//   }
// }

// class MainButton extends StatelessWidget {
//   final void Function()? onPressed;
//   final String text;
//   final double height;
//   final Color color;
//   final bool isLoading;
//   final bool isleft;
//   final bool withBorder;
//   final Color textColor;
//   final Widget icon;
//   const MainButton({
//     super.key,
//     required this.onPressed,
//     required this.text,
//     this.withBorder = false,
//     this.isLoading = false,
//     this.isleft = false,
//     this.height = 48,
//     this.icon = const SizedBox.shrink(),
//     this.textColor = Colors.white,
//     this.color = AppColors.primaryColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       child: ElevatedButton(
//         onPressed: isLoading ? null : onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: withBorder ? Colors.transparent : color,
//           shadowColor: Colors.transparent,
//           shape: RoundedRectangleBorder(
//             side: withBorder
//                 ? const BorderSide(width: 0.5, color: AppColors.primaryColor)
//                 : BorderSide.none,
//             borderRadius: BorderRadius.circular(10).r,
//           ),
//           elevation: 0,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (!isleft) ...[icon, const Space(10)],
//             Text(
//               text,
//               style: context.textTheme.bodyMedium?.copyWith(
//                   color: textColor,
//                   fontSize: 18.sp,
//                   fontWeight: AppFontWeight.bold),
//             ),
//             if (isleft) ...[const Space(10), icon]
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ClickableText extends StatelessWidget {
//   final String text;
//   final Color color;
//   final double textSize;
//   final bool withIcon;
//   final double height;
//   final bool isBold;
//   final Color bgColor;
//   final void Function()? onPressed;
//   const ClickableText(
//       {super.key,
//       this.color = AppColors.primaryColor,
//       required this.text,
//       this.withIcon = false,
//       this.height = 20,
//       this.isBold = false,
//       this.bgColor = Colors.transparent,
//       this.textSize = 15.0,
//       required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       child: TextButton(
//         onPressed: onPressed,
//         style: ButtonStyle(
//             shape: MaterialStateProperty.all<OutlinedBorder>(
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
//             overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
//             backgroundColor: MaterialStateProperty.all<Color>(bgColor),
//             padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
//                 const EdgeInsets.only(left: 10, right: 10)),
//             textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
//               fontWeight: FontWeight.w600,
//               fontFamily: kAppSecondaryFontFamily,
//               fontSize: textSize,
//             )) // Remove splash effect
//             ),
//         // style: TextButton.styleFrom(
//         //   foregroundColor: Colors.transparent,
//         //   shadowColor: Colors.transparent,
//         //   surfaceTintColor: Colors.transparent,
//         //   disabledForegroundColor: Colors.transparent,
//         //   disabledBackgroundColor: Colors.transparent,
//         //   padding: EdgeInsets.zero,
//         //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
//         //   backgroundColor: bgColor,
//         //   elevation: 0,
//         //   textStyle: TextStyle(
//         //     fontWeight: FontWeight.w600,
//         //     fontSize: textSize,
//         //   ),
//         // ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (withIcon) ...[
//               const Icon(
//                 Icons.tune,
//                 color: AppColors.primaryColor,
//               ),
//               Space(10.w),
//             ],
//             Text(
//               text,
//               style: isBold
//                   ? Theme.of(context).textTheme.labelLarge?.copyWith(
//                         color: color,
//                         fontSize: textSize,
//                         letterSpacing: 0.0,
//                         fontWeight: FontWeight.w700,
//                       )
//                   : Theme.of(context).textTheme.labelSmall?.copyWith(
//                         color: color,
//                         fontSize: textSize,
//                         letterSpacing: 0.0,
//                         fontWeight: FontWeight.w500,
//                       ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ButtonBack extends StatelessWidget {
//   final VoidCallback onPressed;
//   const ButtonBack({super.key, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         minimumSize: const Size(15, 45),
//         maximumSize: const Size(50, 60),
//         shadowColor: Colors.grey.shade100,
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(17).r,
//         ),
//         elevation: 2,
//       ),
//       child: const Icon(
//         Icons.arrow_back,
//         color: Colors.black,
//       ),
//     );
//   }
// }

// class CopyButton extends StatelessWidget {
//   final Function()? onTap;
//   const CopyButton({super.key, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             "copy",
//             style: context.textTheme.bodyMedium?.copyWith(
//                 fontFamily: kAppSecondaryFontFamily,
//                 color: AppColors.primaryColor,
//                 fontSize: 16.sp,
//                 height: 1.3,
//                 fontWeight: AppFontWeight.regular),
//           ),
//           const Space(6),
//           SvgPicture.asset(AppImage.copy),
//         ],
//       ),
//     );
//   }
// }

// class ButtonBack2 extends StatelessWidget {
//   final VoidCallback onPressed;
//   final bool isShadow;
//   const ButtonBack2({super.key, required this.onPressed, this.isShadow = true});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       borderRadius: BorderRadius.circular(17.r),
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(boxShadow: [
//           if (isShadow) ...[
//             BoxShadow(
//                 color: Colors.grey.shade200, blurRadius: 5, spreadRadius: 2)
//           ]
//         ], color: Colors.white, borderRadius: BorderRadius.circular(13.r)),
//         child: const Icon(
//           Icons.arrow_back,
//           color: Colors.black,
//           size: 20,
//         ),
//       ),
//     );
//   }
// }

// class SmallButton extends StatelessWidget {
//   final String text;
//   final Color color;
//   final double textSize;
//   final bool withIcon;
//   final void Function()? onPressed;
//   const SmallButton(
//       {super.key,
//       required this.color,
//       required this.text,
//       this.withIcon = false,
//       this.textSize = 13.5,
//       required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       splashColor: Colors.green,
//       child: Container(
//         padding: const EdgeInsets.all(5),
//         child: Text(
//           text,
//           style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                 color: color,
//                 fontSize: textSize,
//                 letterSpacing: 0.6,
//                 fontWeight: FontWeight.w500,
//               ),
//         ),
//       ),
//     );
//   }
// }

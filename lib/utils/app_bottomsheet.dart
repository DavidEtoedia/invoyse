import 'dart:ui';

import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<void> showcustomsheet(BuildContext context,
      {required Widget widget,
      bool isDismissible = true,
      bool enableDrag = true}) async {
    await showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: false,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        barrierColor: Colors.black26,
        useRootNavigator: true,
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        builder: (BuildContext context) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
              child: widget);
        });
  }
}

import 'package:flutter/material.dart';

extension BuildContextThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension BuildContextTextThemeExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension StringInitials on String {
  String get initials {
    List<String> nameParts = split(" ");
    if (nameParts.length > 1) {
      return "${nameParts.first.characters.first}${nameParts.last.characters.first}";
    } else {
      return nameParts.first.characters.first.toString();
    }
  }
}

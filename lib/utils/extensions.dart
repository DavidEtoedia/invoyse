import 'package:flutter/material.dart';

extension BuildContextThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension BuildContextTextThemeExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

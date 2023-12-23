import 'package:flutter/material.dart';
import 'package:invoyse_task/controller/business_model_controller.dart';
import 'package:invoyse_task/utils/navigator.dart';
import 'package:invoyse_task/view/home_page.dart';
import 'package:provider/provider.dart';

import 'utils/app_font/app_font_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;
    final TextTheme customTheme =
        textThemes.apply(fontFamily: kAppPrimaryFontFamily);

    return ChangeNotifierProvider(
      create: (context) => BusinessController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: navigator.key,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: customTheme,
            fontFamily: kAppPrimaryFontFamily,
            primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}

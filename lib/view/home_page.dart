import 'package:flutter/material.dart';
import 'package:invoyse_task/view/widget/top_header.dart';

import 'widget/home_nav_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [TopheaderView(), HomeNavigationView()],
        ),
      ),
    );
  }
}

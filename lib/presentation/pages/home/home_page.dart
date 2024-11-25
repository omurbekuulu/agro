import 'package:agro/presentation/pages/home/widgets/breed_tab_bar_view_widget.dart';
import 'package:agro/presentation/pages/home/widgets/main_tabs_widget.dart';
import 'package:agro/presentation/pages/home/widgets/weather_profit_stack_widget.dart';
import 'package:agro/presentation/uikit/customBreedTabBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            weatherProfitStack(context),
            mainTabsWidget(context),
            const SizedBox(height: 24),
            customBreedTabBar(
              context,
              tabBarViews: breedTabBarViewWidget(context),
            )
          ],
        ),
      ),
    );
  }
}

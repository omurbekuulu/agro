import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/statistics/widgets/breed_tab_bar_view_widget.dart';
import 'package:agro/presentation/pages/statistics/widgets/direction_tab_bar_widget.dart';

import '../../../common/widgets/customBreedTabBar.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Text(
                        '12.11.24 - 23.03.25',
                        style: typography.h2.bold,
                      ),
                      const Spacer(),
                      Text(
                        'Убактысы',
                        style: typography.p1.bold,
                      ),
                      const SizedBox(width: 12),
                      SvgPicture.asset('assets/calendar-icon.svg'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  directionTabBarWidget(context),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // customBreedTabBar(
            //   context,
            //   tabBarViews: breedTabBarViewWidget(context),
            // )
          ],
        ),
      ),
    );
  }
}

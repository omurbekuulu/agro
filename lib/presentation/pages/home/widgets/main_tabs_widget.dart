import 'package:agro/core/configs/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/customBreedTabBar.dart';
import '../../../../domain/percent/entity/percent.dart';
import 'breed_tab_bar_view_widget.dart';

Widget mainTabsWidget(
  BuildContext context, {
  required List tabDirections,
  required List tabBreeds,
  required PercentEntity percent,
}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return DefaultTabController(
    length: tabDirections.length,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          labelStyle: typography.h1.bold,
          labelColor: colors.primary,
          unselectedLabelColor: Colors.black,
          indicatorColor: colors.primary,
          dividerColor: Colors.transparent,
          tabs: List.generate(tabDirections.length, (index) {
            return Tab(
              text: tabDirections[index],
            );
          }),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: MediaQuery.sizeOf(context).height, //TODO: implement view's height
          child: TabBarView(
            children: List.generate(tabDirections.length, (index) {
              return customBreedTabBar(
                context,
                tabs: tabBreeds,
                tabBarViews: breedTabBarViewWidget(context, percent: percent),
              );
            }),
          ),
        ),
      ],
    ),
  );
}

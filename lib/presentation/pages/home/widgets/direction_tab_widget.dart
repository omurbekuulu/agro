import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/domain/recommendation/entity/recommentation.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/customBreedTabBar.dart';
import '../../../../domain/percent/entity/percent.dart';
import 'breed_tab_bar_view_widget.dart';

Widget directionTabWidget(
  BuildContext context, {
  required List tabDirectionNames,
  required List tabBreedNames,
  required PercentEntity percent,
  required List<CardEntity> cards,
}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return Expanded(
    child: DefaultTabController(
      length: tabDirectionNames.length,
      child: Column(
        children: [
          TabBar(
            labelStyle: typography.h1.bold,
            labelColor: colors.primary,
            unselectedLabelColor: Colors.black,
            indicatorColor: colors.primary,
            dividerColor: Colors.transparent,
            tabs: List.generate(tabDirectionNames.length, (index) {
              return Tab(
                text: tabDirectionNames[index],
              );
            }),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: TabBarView(
              children: List.generate(tabDirectionNames.length, (index) {
                return customBreedTabBar(
                  context,
                  tabsNames: tabBreedNames,
                  tabBarViews: breedTabBarViewWidget(
                    context,
                    percent: percent,
                    cards: cards,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    ),
  );
}

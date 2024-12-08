import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import 'package:agro/core/configs/theme/theme.dart';

Widget customBreedTabBar(
  BuildContext context, {
  required List tabs,
  required Widget tabBarViews,
}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  if (tabs.isEmpty) {
    return const Text('Породалар жок'); //TODO: implement isAddedBreed
  }

  return Expanded(
    child: DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 35,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: ButtonsTabBar(
                  width: MediaQuery.sizeOf(context).width / 3.2,
                  contentCenter: true,
                  buttonMargin: const EdgeInsets.only(right: 5),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  backgroundColor: colors.secondary1,
                  unselectedBackgroundColor: colors.onBackground,
                  unselectedLabelStyle:
                      typography.p1.bold.copyWith(color: Colors.black),
                  labelStyle:
                      typography.p1.bold.copyWith(color: colors.background),
                  tabs: List.generate(tabs.length, (index) {
                    return Tab(
                      text: tabs[index],
                    );
                  }),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: TabBarView(
              children: [
                tabBarViews,
              ],
            ),
          )
        ],
      ),
    ),
  );
}

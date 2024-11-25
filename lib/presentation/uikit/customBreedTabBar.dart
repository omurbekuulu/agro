import 'package:agro/presentation/theme/theme.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

final tabss = [
  'Местный',
  'Швед',
  'Голланд',
  'Местный',
  'Швед',
  'Голланд',
  'Местный',
  'Швед',
  'Голланд',
  'Голланд',
];

Widget customBreedTabBar(BuildContext context,
    {required Widget tabBarViews}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return Expanded(
    child: DefaultTabController(
      initialIndex: 0,
      length: 10,
      child: Column(
        children: [
          SizedBox(
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
                tabs: List.generate(10, (index) {
                  return Tab(
                    text: tabss[index],
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: TabBarView(
              children: [
                tabBarViews,
                Center(child: Text('Shved')),
                Center(child: Text('Голланд')),
                Center(child: Text('Mestnyi')),
                Center(child: Text('Shved')),
                Center(child: Text('Голланд')),
                Center(child: Text('Mestnyi')),
                Center(child: Text('Shved')),
                Center(child: Text('Голланд')),
                Center(child: Text('Голланд')),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

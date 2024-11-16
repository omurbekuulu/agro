import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

Widget mainTabsWidget(BuildContext context) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: DefaultTabController(
      length: 2,
      child: TabBar(
        labelStyle: typography.h1.bold,
        labelColor: colors.primary,
        unselectedLabelColor: Colors.black,
        indicatorColor: colors.primary,
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(text: 'Cүт'),
          Tab(text: 'Эт'),
        ],
      ),
    ),
  );
}

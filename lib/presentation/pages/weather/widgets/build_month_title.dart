import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

Widget buildMonthTitle(BuildContext context, {required String month}) {
  final typography = Theme.of(context).appTypography;

  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 29),
          Text(
            month,
            style: typography.h3.semiBold,
          ),
          const SizedBox(height: 24),
        ],
      ),
    ),
  );
}

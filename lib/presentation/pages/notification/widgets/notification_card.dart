import 'package:agro/core/configs/theme/theme.dart';
import 'package:flutter/material.dart';

Widget notificationCard(
    BuildContext context, String title, String description) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: colors.onBackground,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: typography.p1.bold.copyWith(color: colors.secondary1),
          ),
          Text(
            description,
            style: typography.p2.medium,
          )
        ],
      ),
    ),
  );
}

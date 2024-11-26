import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

Widget notificationWidget(
    BuildContext context, String title, String description) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return Container(
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

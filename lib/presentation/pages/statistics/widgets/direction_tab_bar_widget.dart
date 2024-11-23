import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

Widget directionTabBarWidget(BuildContext context) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return Row(
    children: [
      Expanded(
        child: Container(
          height: 78,
          decoration: BoxDecoration(
            color: colors.secondary1,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(35, 123, 123, 123),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                'Cүт',
                style: typography.h0.bold.copyWith(color: colors.background),
              ),
              Text(
                '32 уй',
                style: typography.h3.medium.copyWith(color: colors.background),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Container(
          height: 78,
          decoration: BoxDecoration(
            color: colors.onBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text('Эт', style: typography.h0.bold),
              Text('35 уй', style: typography.h3.medium),
            ],
          ),
        ),
      ),
    ],
  );
}

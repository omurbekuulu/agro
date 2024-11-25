import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

Widget customListTile(BuildContext context) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;
  final mediaWidth = MediaQuery.sizeOf(context).width;

  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: colors.secondary1,
      ),
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            const Text('Мал'),
            SizedBox(width: mediaWidth * 0.38),
            const Text('12 баш'),
            const Spacer(),
            const Text('2445 с'),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Кошумча сөздөр',
          style: typography.p2.medium.copyWith(color: colors.onBackground2),
        )
      ],
    ),
  );
}

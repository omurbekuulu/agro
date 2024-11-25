import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String type;
  final String amount;
  final Color amountColor;

  const CustomCard({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.type,
    required this.amount,
    this.amountColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: colors.onBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: typography.h3.bold,
              ),
              const Spacer(),
              if (subtitle.isNotEmpty)
                Text(subtitle,
                    style: typography.p2.medium
                        .copyWith(color: colors.onBackground2)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            type,
            style: typography.p2.medium,
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: typography.h3.bold.copyWith(color: colors.secondary1),
          ),
        ],
      ),
    );
  }
}

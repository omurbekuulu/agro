import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

Widget listTileData(
  BuildContext context, {
  required String title,
  required String data,
}) {
  final typography = Theme.of(context).appTypography;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 16),
      Text(
        title,
        style: typography.p1.bold,
      ),
      const SizedBox(height: 16),
      Row(
        children: [
          const Spacer(),
          Text(
            data,
            style: typography.h3.bold,
          ),
        ],
      ),
      const SizedBox(height: 12),
      Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xFFD9D9D9),
            ),
          ),
        ),
      )
    ],
  );
}

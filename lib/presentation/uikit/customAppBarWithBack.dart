import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

Widget customAppBarWithBack(BuildContext context, {required String title}) {
  final typography = Theme.of(context).appTypography;

  return Column(
    children: [
      const SizedBox(height: 24),
      Row(
        children: [
          BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(width: 14),
          Text(
            title,
            style: typography.h2.bold,
          )
        ],
      ),
    ],
  );
}

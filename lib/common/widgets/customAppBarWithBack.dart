import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:agro/core/configs/theme/theme.dart';

Widget customAppBarWithBack(BuildContext context, {required String title}) {
  final typography = Theme.of(context).appTypography;

  return Column(
    children: [
      const SizedBox(height: 24),
      Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset('assets/back-icon.svg'),
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

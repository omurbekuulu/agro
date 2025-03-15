import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:agro/core/configs/theme/theme.dart';

Widget profilViewWidget(
  BuildContext context, {
  required String userName,
}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return Column(
    children: [
      const SizedBox(height: 24),
      Container(
        decoration: BoxDecoration(
          color: colors.onBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 4, right: 25, top: 4, bottom: 4),
              child: SvgPicture.asset('assets/human-icon.svg'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                userName,
                style: typography.h3.bold.copyWith(color: colors.secondary1),
              ),
            )
          ],
        ),
      ),
    ],
  );
}

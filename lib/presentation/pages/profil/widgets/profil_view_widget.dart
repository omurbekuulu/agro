import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget profilViewWidget(BuildContext context) {
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
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 4, right: 25, top: 4, bottom: 4),
              child: SvgPicture.asset('assets/human-icon.svg'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Иванов Иван',
                  style: typography.h3.bold.copyWith(color: colors.secondary1),
                ),
                Text(
                  '+996 505 00 12 45',
                  style: typography.p3.regular,
                ),
              ],
            )
          ],
        ),
      ),
    ],
  );
}

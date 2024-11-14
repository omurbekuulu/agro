import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget customTileWidget(BuildContext context, String icon, String title) {
    final typography = Theme.of(context).appTypography;

  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12, right: 16, top: 8, bottom: 8),
        child: SvgPicture.asset(icon),
      ),
      Text(
        title,
        style: typography.p1.bold,
      )
    ],
  );
}

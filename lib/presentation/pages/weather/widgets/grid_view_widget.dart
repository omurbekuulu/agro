import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget gridViewWidget(BuildContext context) {
  final typography = Theme.of(context).appTypography;

  return GridView.count(
    shrinkWrap: true,
    crossAxisCount: 4,
    children: List.generate(30, (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('11.17', style: typography.p3.bold),
          const SizedBox(height: 7),
          Row(
            children: [
              SvgPicture.asset('assets/sunny.svg'),
              const SizedBox(width: 4),
              Column(
                children: [
                  Text('+12\'', style: typography.p3.bold),
                  const SizedBox(height: 6),
                  Text('+22\'', style: typography.p3.bold),
                ],
              ),
            ],
          ),
        ],
      );
    }),
  );
}

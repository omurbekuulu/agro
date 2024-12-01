import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildDays(BuildContext context, {required String weatherIcon}) {
  final typography = Theme.of(context).appTypography;
  final mediaQueryWidth = MediaQuery.sizeOf(context).width;

  return SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: mediaQueryWidth >= 450 ? 5 : 4,
      crossAxisSpacing: 16,
      mainAxisSpacing: 7.5,
      childAspectRatio: mediaQueryWidth >= 450 ? 1 : 1.3,
    ),
    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('11.17', style: typography.p3.bold),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(weatherIcon),
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
    }, childCount: 30),
  );
}

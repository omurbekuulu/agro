import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final date = [
  'Бүгүн',
  'Эртең',
  '18.11',
  '18.11',
];

Widget weatherProfitStack(BuildContext context) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return SizedBox(
    height: 266,
    child: Stack(
      children: [
        Positioned(
          top: 16,
          right: 0,
          left: 0,
          child: Image.asset(
            'assets/farm-clipped.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          top: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              return Column(
                children: [
                  Text(
                    date[index],
                    style:
                        typography.p3.bold.copyWith(color: colors.background),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      SvgPicture.asset(index == 0 || index == 1
                          ? 'assets/thunderstorm.svg'
                          : 'assets/sunny.svg'),
                      const SizedBox(width: 4),
                      Column(
                        children: [
                          Text(
                            '+12\'',
                            style: typography.p3.bold
                                .copyWith(color: colors.background),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '+22\'',
                            style: typography.p3.bold
                                .copyWith(color: colors.background),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          top: 139,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: colors.secondary2,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  'Сүт багытынын рентабелдүүлүгү',
                  style: typography.p1.bold.copyWith(
                    color: colors.background,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '0%',
                  style: typography.h0.bold.copyWith(
                    color: colors.background,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
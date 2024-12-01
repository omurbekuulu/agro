import 'package:agro/presentation/theme/theme.dart';
import 'package:agro/presentation/uikit/customAppBarWithBack.dart';
import 'package:agro/presentation/uikit/customLogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommunicatePage extends StatelessWidget {
  const CommunicatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;
    final colors = Theme.of(context).appColors;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customAppBarWithBack(context, title: 'Биздин байланыштар'),
                const SizedBox(height: 29),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: colors.secondary1,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '0312 00 12 45',
                                  style: typography.h3.semiBold
                                      .copyWith(color: colors.background),
                                ),
                                Text(
                                  'Телефон',
                                  style: typography.p3.regular
                                      .copyWith(color: colors.background),
                                ),
                              ],
                            ),
                            SvgPicture.asset('assets/arrow-right-fill-icon.svg')
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        decoration: BoxDecoration(
                          color: colors.secondary1,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '0505001245',
                                  style: typography.h3.semiBold
                                      .copyWith(color: colors.background),
                                ),
                                Text(
                                  'Ватсап',
                                  style: typography.p3.regular
                                      .copyWith(color: colors.background),
                                ),
                              ],
                            ),
                            SvgPicture.asset('assets/arrow-right-fill-icon.svg')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 24,
              right: 16,
              child: customLogo(),
            ),
          ],
        ),
      ),
    );
  }
}

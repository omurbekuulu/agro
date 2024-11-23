import 'package:agro/presentation/theme/theme.dart';
import 'package:agro/presentation/uikit/customAppBarWithBack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customAppBarWithBack(context, title: '30 күндүк аба ырайы'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 29),
                    const Text('Ноябрь'),
                    const SizedBox(height: 24),
                    GridView.count(
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
                    ),
                    const SizedBox(height: 29),
                    const Text('Ноябрь'),
                    const SizedBox(height: 24),
                    GridView.count(
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

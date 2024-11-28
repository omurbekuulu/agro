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
            CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 29),
                      Text('Ноябрь'),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('11.17', style: typography.p3.bold),
                          const SizedBox(height: 7),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                    }, childCount: 30),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

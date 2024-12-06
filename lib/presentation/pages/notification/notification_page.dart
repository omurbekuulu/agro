import 'package:flutter/material.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/notification/widgets/breed_tab_bar_view.dart';
import 'package:agro/presentation/uikit/customBreedTabBar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    'Рекомендации',
                    style: typography.h2.bold,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 56,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: colors.secondary1,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(35, 123, 123, 123),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            'Cүт',
                            style: typography.h0.bold
                                .copyWith(color: colors.background),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 56,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: colors.onBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text('Эт', style: typography.h0.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            customBreedTabBar(
              context,
              tabBarViews: breedTabBarViewWidget(context),
            ),
          ],
        ),
      ),
    );
  }
}

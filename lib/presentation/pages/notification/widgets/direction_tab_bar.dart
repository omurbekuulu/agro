import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/notification/cubit/notification_cubit.dart';
import 'package:agro/presentation/pages/notification/widgets/breed_tab_bar.dart';
import 'package:agro/presentation/pages/notification/widgets/breed_tab_bar_view.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/breeds/entities/breed.dart';
import '../../../../domain/directions/entity/direction.dart';
import '../../../../domain/recommendation/entity/recommentation.dart';

Widget directionTabWidget(
  BuildContext context, {
  required List<DirectionEntity> tabDirections,
  required List<BreedEntity> tabBreeds,
  required List<CardEntity> cards,
}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  return Expanded(
    child: DefaultTabController(
      length: tabDirections.length,
      child: Builder(builder: (context) {
        final TabController tabController = DefaultTabController.of(context);

        // Слушаем изменения индекса
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            final selectedIndex = tabController.index;
            final selectedDirection = tabDirections[selectedIndex];

            // Обновляем состояние Cubit
            context
                .read<NotificationCubit>()
                .updateDirection(selectedDirection);
          }
        });
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 56,
              child: ButtonsTabBar(
                width: MediaQuery.sizeOf(context).width / 2.15,
                contentCenter: true,
                buttonMargin: const EdgeInsets.only(right: 5),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                backgroundColor: colors.secondary1,
                unselectedBackgroundColor: colors.onBackground,
                unselectedLabelStyle:
                    typography.h0.bold.copyWith(color: Colors.black),
                labelStyle:
                    typography.h0.bold.copyWith(color: colors.background),
                tabs: List.generate(tabDirections.length, (index) {
                  return Tab(
                    text: tabDirections
                        .map((direction) => direction.name)
                        .toList()[index],
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: TabBarView(
                children: List.generate(tabDirections.length, (index) {
                  return breedTabBar(
                    context,
                    tabBreeds: tabBreeds,
                    tabBarViews: breedTabBarViewWidget(
                      context,
                      cards: cards,
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      }),
    ),
  );
}

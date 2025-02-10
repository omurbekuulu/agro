import 'package:agro/domain/breeds/entities/breed.dart';
import 'package:agro/domain/directions/entity/direction.dart';
import 'package:agro/presentation/pages/statistics/cubit/statistics_cubit.dart';
import 'package:flutter/material.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/customBreedTabBar.dart';
import '../../../../domain/percent/entity/percent.dart';
import 'breed_tab_bar_view_widget.dart';

Widget directionTabBarWidget(
  BuildContext context, {
  required List<DirectionEntity> tabDirections,
  required List<BreedEntity> tabBreeds,
  required PercentEntity percent,
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
            context.read<StatisticsCubit>().updateDirection(selectedDirection);
          }
        });
        return Column(
          children: [
            TabBar(
              labelStyle: typography.h1.bold,
              labelColor: colors.primary,
              unselectedLabelColor: Colors.black,
              indicatorColor: colors.primary,
              dividerColor: Colors.transparent,
              tabs: List.generate(tabDirections.length, (index) {
                return Tab(
                  text: tabDirections[index].name,
                );
              }),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: TabBarView(
                children: List.generate(tabDirections.length, (index) {
                  return customBreedTabBar(
                    context,
                    tabBreeds: tabBreeds,
                    tabBarViews: breedTabBarViewWidget(
                      context,
                      percent: percent,
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

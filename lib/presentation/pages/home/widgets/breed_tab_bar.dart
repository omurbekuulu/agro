import 'package:agro/core/configs/theme/theme.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/breeds/entities/breed.dart';
import '../cubit/home_cubit.dart';

Widget breedTabBar(
  BuildContext context, {
  required List<BreedEntity> tabBreeds,
  required Widget tabBarViews,
}) {
  final colors = Theme.of(context).appColors;
  final typography = Theme.of(context).appTypography;

  if (tabBreeds.isEmpty) {
    return const Text('Породалар жок'); //TODO: implement isAddedBreed
  }

  return Expanded(
    child: DefaultTabController(
      initialIndex: 0,
      length: tabBreeds.length,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context);

        // Слушаем изменения индекса
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            final selectedIndex = tabController.index;
            final selectedBreed = tabBreeds[selectedIndex];

            // Обновляем состояние Cubit
            context.read<HomeCubit>().updateBreed(selectedBreed);
          }
        });
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 35,
                  child: ButtonsTabBar(
                    width: MediaQuery.sizeOf(context).width / 3.2,
                    contentCenter: true,
                    buttonMargin: const EdgeInsets.only(right: 5),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    backgroundColor: colors.secondary1,
                    unselectedBackgroundColor: colors.onBackground,
                    unselectedLabelStyle:
                        typography.p1.bold.copyWith(color: Colors.black),
                    labelStyle:
                        typography.p1.bold.copyWith(color: colors.background),
                    tabs: List.generate(tabBreeds.length, (index) {
                      return Tab(
                        text: tabBreeds.map((breed) => breed.name).toList()[index],
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: TabBarView(
                  children: List.generate(
                    tabBreeds.length,
                    (index) => tabBarViews,
                  ),
                ),
              ),
            ],
          );
        }
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/statistics/cubit/statistics_cubit.dart';
import 'package:agro/presentation/pages/statistics/widgets/direction_tab_bar_widget.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;

    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => StatisticsCubit()
            ..initStatistics(
              categoryId: 1,
              directionId: 5,
              petId: 1,
              breedId: 1,
            ), //TODO: implement these response datas
          child: BlocBuilder<StatisticsCubit, StatisticsState>(
            builder: (context, state) {
              if (state is LoadingStatistics) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              if (state is FailureStatistics) {
                return Center(
                  child: Text(
                    state.errorMessage,
                  ),
                );
              }
              if (state is LoadedStatistics) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            '12.11.24 - 23.03.25',
                            style: typography.h2.bold,
                          ),
                          const Spacer(),
                          Text(
                            'Убактысы',
                            style: typography.p1.bold,
                          ),
                          const SizedBox(width: 12),
                          SvgPicture.asset('assets/calendar-icon.svg'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    directionTabBarWidget(
                      context,
                      tabDirectionsNames: state.directions
                          .map((direction) => direction.name)
                          .toList(),
                      tabBreedsNames:
                          state.breeds.map((breed) => breed.name).toList(),
                      percent: state.percent,
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

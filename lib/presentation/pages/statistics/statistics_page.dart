import 'package:agro/presentation/pages/statistics/cubit/date_cubit.dart';
import 'package:agro/presentation/pages/statistics/widgets/date_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/statistics/cubit/statistics_cubit.dart';
import 'package:agro/presentation/pages/statistics/widgets/direction_tab_bar_widget.dart';
import 'package:intl/intl.dart';

import '../../../domain/percent/entity/percent.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;
    final colors = Theme.of(context).appColors;

    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => StatisticsCubit()
                ..initStatistics(), //TODO: implement these response datas
            ),
            BlocProvider(
              create: (context) => DateCubit(),
            ),
          ],
          child: BlocBuilder<StatisticsCubit, StatisticsState>(
            builder: (context, state) {
              if (state is LoadingStatistics) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              if (state is FailureLoadStatistics) {
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
                      child: BlocBuilder<DateCubit, DateState>(
                        builder: (context, state) {
                          final currentDate = state.selectedDateTimeRange ??
                              DateTimeRange(
                                start: DateTime.now(),
                                end: DateTime.now(),
                              );
                          DateFormat dateFormat = DateFormat('dd.MM.yy');
                          return Row(
                            children: [
                              Text(
                                '${dateFormat.format(currentDate.start)} - ${dateFormat.format(currentDate.end)}',
                                style: typography.h2.bold,
                              ),
                              const Spacer(),
                              Text(
                                'Убактысы',
                                style: typography.p1.bold,
                              ),
                              const SizedBox(width: 12),
                              InkWell(
                                highlightColor: colors.onBackground,
                                onTap: () {
                                  displayDateBottomSheet(
                                      context,
                                      colors,
                                      typography,
                                      state.selectedDateTimeRange ??
                                          DateTimeRange(
                                            start: DateTime.now(),
                                            end: DateTime.now(),
                                          ));
                                },
                                child: SvgPicture.asset(
                                    'assets/calendar-icon.svg'),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    directionTabBarWidget(
                      context,
                      tabDirections: state.directions,
                      tabBreeds: state.userBreeds,
                      percent: state.percent ??
                          PercentEntity(
                            expense: 0,
                            income: 0,
                            performance: 0,
                          ),
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

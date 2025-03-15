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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StatisticsCubit()
            ..initStatistics(), //TODO: implement these response datas
        ),
        BlocProvider(
          create: (context) => DateCubit(),
        ),
      ],
      child: const StatisticsView(),
    );
  }
}

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  DateCubit get _dateBloc => context.read<DateCubit>();

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;
    final colors = Theme.of(context).appColors;
    DateFormat dateFormat = DateFormat('dd.MM.yy');
    final selectedDateTimeRange =
        context.select((DateCubit b) => b.state.selectedDateTimeRange);

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<StatisticsCubit, StatisticsState>(
          builder: (context, state) {
            if (state is FailureLoadStatistics) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            if (!state.isLoaded) {
              return Center(
                child: CircularProgressIndicator(
                  color: colors.onBackground3,
                ),
              );
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        '${dateFormat.format(selectedDateTimeRange.start)} - ${dateFormat.format(selectedDateTimeRange.end)}',
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
                            _dateBloc,
                            colors,
                            typography,
                            selectedDateTimeRange,
                          );
                        },
                        child: SvgPicture.asset('assets/calendar-icon.svg'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                directionTabBarWidget(
                  context,
                  tabDirections: state.directions,
                  tabBreeds: state.userBreeds,
                  selectedDirectionId: state.selectedDirectionId,
                  selectedPetsId: state.selectedPetsId ?? 0,
                  percent: state.percent ??
                      PercentEntity(
                        expense: 0,
                        income: 0,
                        performance: 0,
                      ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

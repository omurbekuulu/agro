import 'package:agro/presentation/pages/statistics/cubit/date_cubit.dart';
import 'package:agro/presentation/pages/statistics/widgets/date_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/statistics/cubit/statistics_cubit.dart';
import 'package:agro/presentation/pages/statistics/widgets/direction_tab_bar_widget.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

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
    final focusedDay = context.select((DateCubit b) => b.state.today);

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
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                      SizedBox(width: 12.w),
                      InkWell(
                        highlightColor: colors.onBackground,
                        onTap: () {
                          displayDateBottomSheet(
                            true,
                            context,
                            _dateBloc,
                            selectedDateTimeRange,
                            focusedDay,
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

  Future displayDateBottomSheet(
    bool isCalendarAble,
    BuildContext context,
    DateCubit dateBloc,
    DateTimeRange selectedRange,
    DateTime focusedDay,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      context: context,
      builder: (contextSheet) {
        return SizedBox(
          height: 689.h,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            child: Column(
              children: [
                Row(
                  children: [
                    dateContainer(
                      context,
                      dateBloc,
                      date: selectedRange.start,
                      rangeText: 'Башталышы',
                    ),
                    SizedBox(width: 5.w),
                    dateContainer(
                      context,
                      dateBloc,
                      date: selectedRange.end,
                      rangeText: 'Аягы',
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                isCalendarAble
                    ? Container()
                    : Column(
                        children: [
                          Row(
                            children: [
                              _button(
                                context,
                                dateBloc,
                                text: 'Бүгүнкү',
                                range: DateTimeRange(
                                  start: DateTime.now(),
                                  end: DateTime.now(),
                                ),
                                selectedRange: selectedRange,
                              ),
                              SizedBox(width: 5.w),
                              _button(
                                context,
                                dateBloc,
                                text: 'Бир жума',
                                range: DateTimeRange(
                                  start: DateTime.now()
                                      .subtract(const Duration(days: 7)),
                                  end: DateTime.now(),
                                ),
                                selectedRange: selectedRange,
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              _button(
                                context,
                                dateBloc,
                                text: 'Жылдык',
                                range: DateTimeRange(
                                  start: DateTime(
                                    DateTime.now().year - 1,
                                    DateTime.now().month,
                                    DateTime.now().day,
                                  ),
                                  end: DateTime.now(),
                                ),
                                selectedRange: selectedRange,
                              ),
                              SizedBox(width: 5.w),
                              _button(
                                context,
                                dateBloc,
                                text: 'Бир ай',
                                range: DateTimeRange(
                                  start: DateTime(
                                    DateTime.now().month == 1
                                        ? DateTime.now().year - 1
                                        : DateTime.now().year,
                                    DateTime.now().month == 1
                                        ? 12
                                        : DateTime.now().month - 1,
                                    DateTime.now().day,
                                  ),
                                  end: DateTime.now(),
                                ),
                                selectedRange: selectedRange,
                              ),
                            ],
                          ),
                        ],
                      ),
                SizedBox(height: 16.h),
                Expanded(
                  child: TableCalendar(
                    locale: 'ru_RU',
                    rowHeight: 39.h,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextFormatter: (date, locale) =>
                          toBeginningOfSentenceCase(
                              DateFormat('LLLL yyyy', locale).format(date)),
                    ),
                    availableGestures: AvailableGestures.all,
                    focusedDay: context.watch<DateCubit>().state.today,
                    firstDay: DateTime(2000),
                    lastDay: DateTime.now(),
                    onDaySelected: (selectedDay, day) {
                      dateBloc.onSelectedDate(selectedDay);
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Көрсөтүү'),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _button(
    BuildContext context,
    DateCubit dateBloc, {
    required String text,
    required DateTimeRange range,
    required DateTimeRange selectedRange,
  }) {
    final isSelected = range == selectedRange;
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Expanded(
      child: FilledButton(
        onPressed: () {
          dateBloc.updateSelectedDate(range);
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isSelected ? colors.primary : colors.onBackground,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          ),
        ),
        child: Text(
          text,
          style: typography.p1.medium.copyWith(color: colors.onBackground3),
        ),
      ),
    );
  }

  Widget dateContainer(
    BuildContext context,
    DateCubit dateBloc, {
    required String rangeText,
    required DateTime date,
  }) {
    DateFormat dateFormat = DateFormat('dd.MM.yy');
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 56.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: colors.onBackground,
          ),
          child: Row(
            children: [
              SizedBox(width: 12.w),
              SvgPicture.asset('assets/date.svg'),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    rangeText,
                    style: typography.p1.medium
                        .copyWith(color: colors.onBackground3),
                  ),
                  Text(
                    dateFormat.format(date),
                    style: typography.p1.medium
                        .copyWith(color: colors.onBackground3),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/statistics/cubit/statistics_cubit.dart';
import 'package:agro/presentation/pages/statistics/widgets/direction_tab_bar_widget.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsCubit()
        ..initStatistics(), //TODO: implement these response datas

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
  StatisticsCubit get _pageBloc => context.read<StatisticsCubit>();

  @override
  Widget build(BuildContext context) {
    final typography = Theme.of(context).appTypography;
    final colors = Theme.of(context).appColors;
    DateFormat dateFormat = DateFormat('dd.MM.yy');
    var selectedRange =
        context.select((StatisticsCubit b) => b.state.selectedDateTimeRange);

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<StatisticsCubit, StatisticsState>(
          builder: (context, state) {
            if (state.isFailure) {
              return Center(
                child: Text(state.failureMessage),
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
                        '${dateFormat.format(selectedRange.start)} - ${dateFormat.format(selectedRange.end)}',
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
                          _pageBloc.switchRange(
                              isStartRange: false, isEndRange: false);
                          displayDateBottomSheet(
                            false,
                            context,
                            state.focusedDay,
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
                  percent: state.percent!,
                  transactions: state.transactions,
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
    DateTime focusedDay,
  ) {
    DateFormat dateFormat = DateFormat('dd.MM.yy');
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;
    final selectedRange = _pageBloc.state.selectedDateTimeRange;
    final isStartRange = _pageBloc.state.isStartRange;
    final isEndRange = _pageBloc.state.isEndRange;

    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      context: context,
      builder: (contextSheet) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        _pageBloc.switchRange(
                            isStartRange: true, isEndRange: false);
                        displayDateBottomSheet(
                          true,
                          context,
                          _pageBloc.state.focusedDay,
                        );
                      },
                      child: Container(
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: isStartRange
                              ? colors.secondary1
                              : colors.onBackground,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 12.w),
                            SvgPicture.asset(
                              'assets/date.svg',
                              color: isStartRange
                                  ? colors.background
                                  : colors.onBackground3,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Башталышы',
                                  style: typography.p1.medium.copyWith(
                                      color: isStartRange
                                          ? colors.background
                                          : colors.onBackground3),
                                ),
                                Text(
                                  dateFormat.format(selectedRange.start),
                                  style: typography.p1.medium.copyWith(
                                      color: isStartRange
                                          ? colors.background
                                          : colors.onBackground3),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        _pageBloc.switchRange(
                            isEndRange: true, isStartRange: false);
                        displayDateBottomSheet(
                          true,
                          context,
                          _pageBloc.state.focusedDay,
                        );
                      },
                      child: Container(
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: isEndRange
                              ? colors.secondary1
                              : colors.onBackground,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 12.w),
                            SvgPicture.asset(
                              'assets/date.svg',
                              color: isEndRange
                                  ? colors.background
                                  : colors.onBackground3,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Аягы',
                                  style: typography.p1.medium.copyWith(
                                      color: isEndRange
                                          ? colors.background
                                          : colors.onBackground3),
                                ),
                                Text(
                                  dateFormat.format(selectedRange.end),
                                  style: typography.p1.medium.copyWith(
                                      color: isEndRange
                                          ? colors.background
                                          : colors.onBackground3),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              isCalendarAble
                  ? TableCalendar(
                      locale: 'ru_RU',
                      rowHeight: 39.h,
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleTextFormatter: (date, locale) =>
                            toBeginningOfSentenceCase(
                                DateFormat('LLLL yyyy', locale).format(date)),
                      ),
                      availableGestures: AvailableGestures.all,
                      selectedDayPredicate: (day) => isSameDay(day, focusedDay),
                      focusedDay: focusedDay,
                      firstDay: DateTime(2000),
                      lastDay: DateTime.now(),
                      onDaySelected: (selectedDay, day) {
                        Navigator.of(context).pop();
                        _pageBloc.onSelectDate(selectedDay);
                        displayDateBottomSheet(
                          true,
                          context,
                          selectedDay,
                        );
                      },
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            _button(
                              context,
                              text: 'Бүгүнкү',
                              range: DateTimeRange(
                                start: DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day - 1,
                                  23,
                                  59,
                                  59,
                                ),
                                end: DateTime.now(),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            _button(
                              context,
                              text: 'Бир жума',
                              range: DateTimeRange(
                                start: DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                ).subtract(const Duration(days: 7)),
                                end: DateTime.now(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            _button(
                              context,
                              text: 'Жылдык',
                              range: DateTimeRange(
                                start: () {
                                  final now = DateTime.now();
                                  final lastYear = DateTime(
                                      now.year - 1, now.month, now.day);
                                  if (lastYear.month == now.month &&
                                      lastYear.day == now.day) {
                                    return lastYear;
                                  } else {
                                    return DateTime(now.year - 1, now.month, 1)
                                        .subtract(const Duration(days: 1));
                                  }
                                }(),
                                end: DateTime.now(),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            _button(
                              context,
                              text: 'Бир ай',
                              range: DateTimeRange(
                                start: () {
                                  final now = DateTime.now();
                                  final lastMonth = now.month == 1
                                      ? DateTime(now.year - 1, 12, now.day)
                                      : DateTime(
                                          now.year, now.month - 1, now.day);

                                  if (lastMonth.month == now.month - 1 ||
                                      (now.month == 1 &&
                                          lastMonth.month == 12)) {
                                    return lastMonth;
                                  } else {
                                    return DateTime(now.year, now.month, 1)
                                        .subtract(const Duration(days: 1));
                                  }
                                }(),
                                end: DateTime.now(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
              SizedBox(height: 32.h),
              FilledButton(
                onPressed: () {
                  _pageBloc.onFilter(
                    
                  );
                  Navigator.pop(context);
                },
                child: const Text('Көрсөтүү'),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Widget _button(
    BuildContext context, {
    required String text,
    required DateTimeRange range,
  }) {
    final selectedRange = _pageBloc.state.selectedDateTimeRange;

    final isSelected =
        DateTime(range.start.year, range.start.month, range.start.day)
                .isAtSameMomentAs(DateTime(
              selectedRange.start.year,
              selectedRange.start.month,
              selectedRange.start.day,
            )) &&
            DateTime(range.end.year, range.end.month, range.end.day)
                .isAtSameMomentAs(DateTime(
              selectedRange.end.year,
              selectedRange.end.month,
              selectedRange.end.day,
            ));

    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Expanded(
      child: FilledButton(
        onPressed: () {
          Navigator.of(context).pop();
          _pageBloc.updateSelectedDate(range);
          displayDateBottomSheet(
            false,
            context,
            _pageBloc.state.focusedDay,
          );
        },
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isSelected ? colors.secondary1 : colors.onBackground,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          ),
        ),
        child: Text(
          text,
          style: typography.p1.medium.copyWith(
              color: isSelected ? colors.background : colors.onBackground3),
        ),
      ),
    );
  }
}

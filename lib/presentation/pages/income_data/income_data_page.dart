import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/presentation/pages/income_data/cubit/income_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:agro/presentation/pages/income_data/widget/custom_list_tile.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class IncomeDataPage extends StatelessWidget {
  const IncomeDataPage({
    super.key,
    required this.userPetId,
    required this.directionId,
  });

  final int userPetId;
  final int directionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IncomeDataCubit()
        ..initIncomePage(userPetId: userPetId, directionId: directionId),
      child: const IncomeDataView(),
    );
  }
}

class IncomeDataView extends StatefulWidget {
  const IncomeDataView({super.key});

  @override
  State<IncomeDataView> createState() => _IncomeDataViewState();
}

class _IncomeDataViewState extends State<IncomeDataView> {
  IncomeDataCubit get _pageBloc => context.read<IncomeDataCubit>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;
    final mediaWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<IncomeDataCubit, IncomeDataState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset('assets/back-icon.svg'),
                      ),
                      const SizedBox(width: 24),
                      Text(
                        'Киреше',
                        style: typography.h3.bold,
                      ),
                      const Spacer(),
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
                  const SizedBox(height: 29),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Text('Аталышы'),
                        SizedBox(width: mediaWidth * 0.32),
                        const Text('Саны'),
                        const Spacer(),
                        const Text('Сумма'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return customListTile(context);
                      },
                      itemCount: 20,
                    ),
                  ),
                ],
              ),
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
                  _pageBloc.onFilter();
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

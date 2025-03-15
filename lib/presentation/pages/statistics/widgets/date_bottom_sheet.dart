import 'package:agro/common/helper/navigation/app_navigator.dart';
import 'package:agro/core/configs/theme/color_extantion.dart';
import 'package:agro/core/configs/theme/typography_extantion.dart';
import 'package:agro/presentation/pages/statistics/cubit/date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

Future displayDateBottomSheet(
  BuildContext context,
  DateCubit dateBloc,
  AppColorExtantion colors,
  AppTypographyExtension typogrphy,
  DateTimeRange selectedRange,
) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    context: context,
    builder: (context) {
      return SizedBox(
        height: 300,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Column(
            children: [
              Row(
                children: [
                  dateContainer(
                    context,
                    dateBloc,
                    colors: colors,
                    typography: typogrphy,
                    date: selectedRange.start,
                    rangeText: 'Башталышы',
                  ),
                  const SizedBox(width: 5),
                  dateContainer(
                    context,
                    dateBloc,
                    colors: colors,
                    typography: typogrphy,
                    date: selectedRange.end,
                    rangeText: 'Аягы',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _button(
                    context,
                    dateBloc,
                    colors: colors,
                    typography: typogrphy,
                    text: 'Бүгүнкү',
                    range: DateTimeRange(
                      start: DateTime.now(),
                      end: DateTime.now(),
                    ),
                    selectedRange: selectedRange,
                  ),
                  const SizedBox(width: 5),
                  _button(
                    context,
                    dateBloc,
                    colors: colors,
                    typography: typogrphy,
                    text: 'Бир жума',
                    range: DateTimeRange(
                      start: DateTime.now().subtract(const Duration(days: 7)),
                      end: DateTime.now(),
                    ),
                    selectedRange: selectedRange,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  _button(
                    context,
                    dateBloc,
                    colors: colors,
                    typography: typogrphy,
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
                  const SizedBox(width: 5),
                  _button(
                    context,
                    dateBloc,
                    colors: colors,
                    typography: typogrphy,
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
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Көрсөтүү'),
              ),
              const SizedBox(height: 16),
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
  required AppColorExtantion colors,
  required AppTypographyExtension typography,
  required String text,
  required DateTimeRange range,
  required DateTimeRange selectedRange,
}) {
  final isSelected = range == selectedRange;
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
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
  required AppColorExtantion colors,
  required AppTypographyExtension typography,
  required String rangeText,
  required DateTime date,
}) {
  DateFormat dateFormat = DateFormat('dd.MM.yy');

  return Expanded(
    child: GestureDetector(
      onTap: () {
      },
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colors.onBackground,
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
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

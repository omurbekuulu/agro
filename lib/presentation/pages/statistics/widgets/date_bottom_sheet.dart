import 'package:agro/common/helper/navigation/app_navigator.dart';
import 'package:agro/core/configs/theme/color_extantion.dart';
import 'package:agro/core/configs/theme/typography_extantion.dart';
import 'package:agro/presentation/pages/statistics/cubit/date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

Future displayDateBottomSheet(
  BuildContext context,
  AppColorExtantion colors,
  AppTypographyExtension typogrphy,
  DateTimeRange range,
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
                  _dateContainer(
                    context,
                    colors: colors,
                    typography: typogrphy,
                    range: range.start,
                    rangeText: 'Башталышы',
                  ),
                  const SizedBox(width: 5),
                  _dateContainer(
                    context,
                    colors: colors,
                    typography: typogrphy,
                    range: range.end,
                    rangeText: 'Аягы',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _button(
                    context,
                    colors: colors,
                    typography: typogrphy,
                    text: 'Бүгүнкү',
                    range: DateTimeRange(
                      start: DateTime.now().subtract(const Duration(days: 7)),
                      end: DateTime.now(),
                    ),
                  ),
                  const SizedBox(width: 5),
                  _button(
                    context,
                    colors: colors,
                    typography: typogrphy,
                    text: 'Бир жума',
                    range: DateTimeRange(
                      start: DateTime.now(),
                      end: DateTime.now(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  _button(
                    context,
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
                  ),
                  const SizedBox(width: 5),
                  _button(
                    context,
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
                  ),
                ],
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {},
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

class CalendarBottomSheet extends StatefulWidget {
  @override
  _CalendarBottomSheetState createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  DateTime _selectedDate = DateTime.now();
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 30));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Календарь в модальном окне'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildDateBox('Башталышы', _startDate, () {
                            _pickDate(context, isStartDate: true);
                          }),
                          _buildDateBox('Аягы', _endDate, () {
                            _pickDate(context, isStartDate: false);
                          }),
                        ],
                      ),
                      SizedBox(height: 16),
                      TableCalendar(
                        focusedDay: _selectedDate,
                        firstDay: DateTime(2000),
                        lastDay: DateTime(2100),
                        calendarFormat: CalendarFormat.month,
                        selectedDayPredicate: (day) =>
                            isSameDay(day, _selectedDate),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDate = selectedDay;
                          });
                        },
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                        ),
                        calendarStyle: CalendarStyle(
                          todayDecoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Text('Тандоо'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Text('Открыть календарь'),
        ),
      ),
    );
  }

  Widget _buildDateBox(String label, DateTime date, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.green),
            ),
            SizedBox(height: 4),
            Text(
              '${date.day}.${date.month}.${date.year}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate(BuildContext context,
      {required bool isStartDate}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = pickedDate;
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }
}

Widget _dateContainer(
  BuildContext context, {
  required AppColorExtantion colors,
  required AppTypographyExtension typography,
  required String rangeText,
  required DateTime range,
}) {
  DateFormat dateFormat = DateFormat('dd.MM.yy');

  return Expanded(
    child: GestureDetector(
      onTap: () async {
        AppNavigator.push(context, CalendarBottomSheet());
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
                  dateFormat.format(range),
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

Widget _button(
  BuildContext context, {
  required AppColorExtantion colors,
  required AppTypographyExtension typography,
  required String text,
  required DateTimeRange range,
}) {
  return Expanded(
    child: FilledButton(
      onPressed: () {
        context.read<DateCubit>().updateSelectedDate(range);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(colors.onBackground),
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
      child: Text(
        text,
        style: typography.p1.medium.copyWith(color: colors.onBackground3),
      ),
    ),
  );
}

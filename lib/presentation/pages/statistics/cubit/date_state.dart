// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'date_cubit.dart';

class DateState extends Equatable {
  const DateState({
    required this.selectedDateTimeRange,
    required this.today,
  });

  final DateTimeRange selectedDateTimeRange;
  final DateTime today;

  DateState copyWith({
    DateTimeRange? selectedDateTimeRange,
    DateTime? today,
  }) {
    return DateState(
      selectedDateTimeRange:
          selectedDateTimeRange ?? this.selectedDateTimeRange,
      today: today ?? this.today,
    );
  }

  @override
  List<Object> get props => [
        selectedDateTimeRange,
        today,
      ];
}

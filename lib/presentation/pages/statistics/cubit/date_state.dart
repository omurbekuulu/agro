// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'date_cubit.dart';

class DateState extends Equatable {
  const DateState({this.selectedDateTimeRange});

  final DateTimeRange? selectedDateTimeRange;

  DateState copyWith({
    DateTimeRange? selectedDateTimeRange,
  }) {
    return DateState(
      selectedDateTimeRange: selectedDateTimeRange ?? this.selectedDateTimeRange,
    );
  }
  
  @override
  List<Object> get props => [selectedDateTimeRange!];
}

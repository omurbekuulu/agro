part of 'income_data_cubit.dart';

@immutable
class IncomeDataState extends Equatable {
  final bool isFailure;
  final String failureMessage;
  final DateTimeRange selectedDateTimeRange;
  final DateTime selectedStartTimeRange;
  final DateTime selectedEndTimeRange;
  final bool isStartRange;
  final bool isEndRange;
  final DateTime focusedDay;
  final List<TransactionEntity> transactions;

  const IncomeDataState({
    this.isFailure = false,
    this.failureMessage = '',
    required this.selectedDateTimeRange,
    required this.selectedStartTimeRange,
    required this.selectedEndTimeRange,
    this.isStartRange = false,
    this.isEndRange = false,
    required this.focusedDay,
    this.transactions = const [],
  });

  IncomeDataState copyWith({
    bool? isFailure,
    String? failureMessage,
    DateTimeRange? selectedDateTimeRange,
    DateTime? selectedStartTimeRange,
    DateTime? selectedEndTimeRange,
    bool? isStartRange,
    bool? isEndRange,
    DateTime? focusedDay,
    List<TransactionEntity>? transactions,
  }) {
    return IncomeDataState(
      isFailure: isFailure ?? this.isFailure,
      failureMessage: failureMessage ?? this.failureMessage,
      selectedDateTimeRange:
          selectedDateTimeRange ?? this.selectedDateTimeRange,
      selectedStartTimeRange:
          selectedStartTimeRange ?? this.selectedStartTimeRange,
      selectedEndTimeRange: selectedEndTimeRange ?? this.selectedEndTimeRange,
      isStartRange: isStartRange ?? this.isStartRange,
      isEndRange: isEndRange ?? this.isEndRange,
      focusedDay: focusedDay ?? this.focusedDay,
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  List<Object?> get props {
    return [
      isFailure,
      failureMessage,
      selectedDateTimeRange,
      selectedStartTimeRange,
      selectedEndTimeRange,
      isStartRange,
      isEndRange,
      transactions,
    ];
  }
}

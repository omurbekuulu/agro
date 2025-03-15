import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit()
      : super(
          DateState(
              selectedDateTimeRange: DateTimeRange(
            start: DateTime.now(),
            end: DateTime.now(),
          )),
        );

  void updateSelectedDate(DateTimeRange selectedDate) {
    emit(
      state.copyWith(selectedDateTimeRange: selectedDate),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit() : super(const DateState());

  void updateSelectedDate(DateTimeRange selectedDate) {
    state.copyWith(selectedDateTimeRange: selectedDate);
  }
}

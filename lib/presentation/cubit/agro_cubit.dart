import 'package:agro/presentation/pages/weather/weather_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'agro_state.dart';

class AgroCubit extends Cubit<AgroState> {
  AgroCubit() : super(const AgroState());

  void saveWeather(Weather weather) {
    emit(
      state.copyWith(weather: weather),
    );
  }

  void validateForm(bool isValid) {
    emit(state.copyWith(isValid: isValid));
  }
}

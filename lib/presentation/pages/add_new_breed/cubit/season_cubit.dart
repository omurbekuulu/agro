import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../domain/breeds/entities/season.dart';
import '../../../../domain/breeds/use_cases/get_seasons.dart';
import '../../../service_locator.dart';

part 'season_state.dart';

class SeasonsCubit extends Cubit<SeasonsState> {
  SeasonsCubit() : super(LoadingSeasons());

  void getSeasons() async {
    var responseData = await sl<GetSeasonsUseCase>().call();

    responseData.fold(
      (error) {
        emit(
          FailureLoadSeasons(errorMessage: error),
        );
      },
      (data) {
        emit(
          LoadedSeasons(seasons: data),
        );
      },
    );
  }
}

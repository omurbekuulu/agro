part of 'season_cubit.dart';

@immutable
sealed class SeasonsState {}

class LoadingSeasons extends SeasonsState {}

class LoadedSeasons extends SeasonsState {
  final List<SeasonEntity> seasons;

  LoadedSeasons({required this.seasons});
}

class FailureLoadSeasons extends SeasonsState {
  final String errorMessage;

  FailureLoadSeasons({required this.errorMessage});
}

part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

class InitialHome extends HomeState {}

class LoadingHome extends HomeState {}

class LoadedHome extends HomeState {
  final List<DirectionEntity> directions;
  final int profitability;
  final List<BreedEntity> breeds;
  final PercentEntity percent;
  final List<CardEntity> cards;

  LoadedHome({
    required this.profitability,
    required this.breeds,
    required this.directions,
    required this.percent,
    required this.cards,
  });
}

class FailureLoadHome extends HomeState {
  final String errorMessage;

  FailureLoadHome({required this.errorMessage});
}

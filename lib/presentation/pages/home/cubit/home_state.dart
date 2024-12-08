part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

class InitialHome extends HomeState {}

class LoadingHome extends HomeState {}

class LoadedHome extends HomeState {
  final int? profitability;
  final List<BreedEntity> breeds;

  LoadedHome({
    this.profitability,
    this.breeds = const [],
  });
}

class FailureLoadHome extends HomeState {
  final String errorMessage;

  FailureLoadHome({required this.errorMessage});
}

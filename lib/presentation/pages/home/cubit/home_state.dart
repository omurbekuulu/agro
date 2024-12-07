part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

class LoadingBreeds extends HomeState {}

class LoadedBreeds extends HomeState {
  final List<BreedEntity> breeds;

  LoadedBreeds({required this.breeds});
}

class FailureLoadBreeds extends HomeState {
  final String errorMessage;

  FailureLoadBreeds({required this.errorMessage});
}

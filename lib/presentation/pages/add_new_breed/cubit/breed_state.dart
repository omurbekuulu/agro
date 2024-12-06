part of 'breed_cubit.dart';

@immutable
sealed class BreedsState {}

class LoadingBreeds extends BreedsState {}

class LoadedBreeds extends BreedsState {
  final List<BreedEntity> breeds;

  LoadedBreeds({required this.breeds});
}

class FailureLoadBreeds extends BreedsState {
  final String errorMessage;

  FailureLoadBreeds({required this.errorMessage});
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_new_breed_cubit.dart';

@immutable
sealed class AddNewBreedState {}

class LoadingAddNewBreed extends AddNewBreedState {}

class LoadedAddNewBreed extends AddNewBreedState {
  final List<BreedEntity> breeds;
  final List<SeasonEntity> seasons;

  LoadedAddNewBreed({
    this.breeds = const [],
    this.seasons = const [],
  });

}

class FailureLoadAddNewBreed extends AddNewBreedState {
  final String errorMessage;

  FailureLoadAddNewBreed({required this.errorMessage});
}

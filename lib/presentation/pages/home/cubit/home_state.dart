part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

class InitialHome extends HomeState {}

class LoadingHome extends HomeState {}

class LoadedHome extends HomeState {
  final List<DirectionEntity> directions;
  final int profitability;
  final List<PetEntity> userPets;
  final List<BreedEntity> userBreeds;
  final PercentEntity? percent;
  final List<CardEntity> cards;
  final int selectedDirectionId;
  final int selectedBreedId;
  final int selectedPetsId;

  LoadedHome({
    this.userPets = const [],
    this.selectedBreedId = 1,
    this.selectedDirectionId = 1,
    this.selectedPetsId = 1,
    this.profitability = 0,
    this.userBreeds = const [],
    this.directions = const [],
    this.percent,
    this.cards = const [],
  });

  LoadedHome copyWith({
    List<DirectionEntity>? directions,
    List<PetEntity>? userPets,
    int? profitability,
    List<BreedEntity>? userBreeds,
    PercentEntity? percent,
    List<CardEntity>? cards,
    int? selectedDirectionId,
    int? selectedBreedId,
    int? selectedPetsId,
  }) {
    return LoadedHome(
      directions: directions ?? this.directions,
      userPets: userPets ?? this.userPets,
      profitability: profitability ?? this.profitability,
      userBreeds: userBreeds ?? this.userBreeds,
      percent: percent ?? this.percent,
      cards: cards ?? this.cards,
      selectedDirectionId: selectedDirectionId ?? this.selectedDirectionId,
      selectedBreedId: selectedBreedId ?? this.selectedBreedId,
      selectedPetsId: selectedPetsId ?? this.selectedPetsId,
    );
  }
}

class FailureLoadHome extends HomeState {
  final String errorMessage;

  FailureLoadHome({required this.errorMessage});
}
